let parse_line line = 
    String.split_on_char ' ' line 
    |> List.filter (fun s -> s <> "")
    |> List.map int_of_string |> fun x -> match x with [x; y] -> (x, y) | _ -> failwith "Invalid line"

let rec get_list acc = match In_channel.input_line In_channel.stdin with
    | Some "" -> acc 
    | Some value -> (value |> parse_line) :: (get_list acc)
    | exception End_of_file -> acc
    | _ -> acc

let distance x y = abs (y - x)

(* part 1 *)
let part_1 lines () = 
    let left = List.map (fun (x, y) -> x) lines |> List.sort compare in
    let right = List.map (fun (x, y) -> y) lines |> List.sort compare in
    let distance = List.combine left right |> List.map (fun (x, y) -> distance x y) in
    List.fold_left (+) 0 distance

let many_times_in el lst = List.fold_left (fun acc y -> if el == y then acc + 1 else acc) 0 lst

(* part 2 *)
let part_2 lines () = 
    let left = List.map (fun (x, y) -> x) lines in
    let right = List.map (fun (x, y) -> y) lines in
    let left_simility = List.map (fun x -> x * many_times_in x right) left in
    List.fold_left (+) 0 left_simility
    
let () = let input = get_list [] in
    Printf.printf "Part 1: %d\n" (part_1 input ());
    Printf.printf "Part 2: %d\n" (part_2 input ())
