(*
 * Copyright (C) 2011-2013 Citrix Systems Inc
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *)

module type BLOCK_DEVICE = V1.BLOCK.CLIENT
with type page_aligned_buffer = Cstruct.t
and type 'a io = 'a Lwt.t

module type IO_PAGE = V1.IO_PAGE

module type FS = V1.FS
with type page_aligned_buffer = Cstruct.t
and type 'a io = 'a Lwt.t

module Error = struct

  let to_string = function
    | `Not_a_directory x ->
      Printf.sprintf "Not_a_directory %s" x
    | `Is_a_directory x->
      Printf.sprintf "Is_a_directory %s" x
    | `Directory_not_empty x ->
      Printf.sprintf "Directory_not_empty %s" x
    | `No_directory_entry (x, y) ->
      Printf.sprintf "There is no entry named '%s' in directory '%s'" y x
    | `File_already_exists x ->
      Printf.sprintf "File_already_exists %s" x
    | `No_space ->
      Printf.sprintf "No_space"
    | `Format_not_recognised details ->
      Printf.sprintf "Format_not_recognised: %s" details
    | `Unknown_error x ->
      Printf.sprintf "Unknown_error: %s" x
    | `Block_device _ ->
      Printf.sprintf "Block device error"
end

