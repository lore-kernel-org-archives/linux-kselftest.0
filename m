From: jakub.kicinski at netronome.com (Jakub Kicinski)
Date: Fri, 9 Nov 2018 12:15:11 -0800
Subject: [PATCH v5 bpf-next 0/7] bpftool: support loading flow dissector
In-Reply-To: <20181109162146.78019-1-sdf@google.com>
References: <20181109162146.78019-1-sdf@google.com>
Message-ID: <20181109121511.254dfd59@cakuba.netronome.com>

On Fri,  9 Nov 2018 08:21:39 -0800, Stanislav Fomichev wrote:
> v5 changes:
> * FILE -> PATH for load/loadall (can be either file or directory now)
> * simpler implementation for __bpf_program__pin_name
> * removed p_err for REQ_ARGS checks
> * parse_atach_detach_args -> parse_attach_detach_args
> * for -> while in bpf_object__pin_{programs,maps} recovery

Thanks!  Patch 3 needs attention from maintainers but the rest LGTM!
