From: quentin.monnet@netronome.com (Quentin Monnet)
Date: Fri, 9 Nov 2018 17:38:54 +0000
Subject: [PATCH v5 bpf-next 0/7] bpftool: support loading flow dissector
In-Reply-To: <20181109162146.78019-1-sdf@google.com>
References: <20181109162146.78019-1-sdf@google.com>
Message-ID: <968d6aa3-8e98-1716-408b-332edd5ad4a3@netronome.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181109173854.ug8MibnGFl6tp7T1_WK9AGR6a47DqyTr-AZvvS0wp3c@z>

2018-11-09 08:21 UTC-0800 ~ Stanislav Fomichev <sdf at google.com>
> v5 changes:
> * FILE -> PATH for load/loadall (can be either file or directory now)
> * simpler implementation for __bpf_program__pin_name
> * removed p_err for REQ_ARGS checks
> * parse_atach_detach_args -> parse_attach_detach_args
> * for -> while in bpf_object__pin_{programs,maps} recovery
> 
> v4 changes:
> * addressed another round of comments/style issues from Jakub Kicinski &
>   Quentin Monnet (thanks!)
> * implemented bpf_object__pin_maps and bpf_object__pin_programs helpers and
>   used them in bpf_program__pin
> * added new pin_name to bpf_program so bpf_program__pin
>   works with sections that contain '/'
> * moved *loadall* command implementation into a separate patch
> * added patch that implements *pinmaps* to pin maps when doing
>   load/loadall
> 
> v3 changes:
> * (maybe) better cleanup for partial failure in bpf_object__pin
> * added special case in bpf_program__pin for programs with single
>   instances
> 
> v2 changes:
> * addressed comments/style issues from Jakub Kicinski & Quentin Monnet
> * removed logic that populates jump table
> * added cleanup for partial failure in bpf_object__pin
> 
> This patch series adds support for loading and attaching flow dissector
> programs from the bpftool:
> 
> * first patch fixes flow dissector section name in the selftests (so
>   libbpf auto-detection works)
> * second patch adds proper cleanup to bpf_object__pin, parts of which are now
>   being used to attach all flow dissector progs/maps
> * third patch adds special case in bpf_program__pin for programs with
>   single instances (we don't create <prog>/0 pin anymore, just <prog>)
> * forth patch adds pin_name to the bpf_program struct
>   which is now used as a pin name in bpf_program__pin et al
> * fifth patch adds *loadall* command that pins all programs, not just
>   the first one
> * sixth patch adds *pinmaps* argument to load/loadall to let users pin
>   all maps of the obj file
> * seventh patch adds actual flow_dissector support to the bpftool and
>   an example

The series look good to me, thanks!

For the bpftool parts:
Acked-by: Quentin Monnet <quentin.monnet at netronome.com>
