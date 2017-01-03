default:
	for d in ch*; do make $$d; done

ch%: FORCE
	cd $@ && ocamlbuild -r -use-ocamlfind -pkg 'core' -tag "thread,package(ppx_sexp_conv)" main.native *.ml

clean:
	rm -rf */*.cmi */*.cmo */_build */*.native

FORCE:
