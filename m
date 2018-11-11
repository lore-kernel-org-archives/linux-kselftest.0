From: alexei.starovoitov at gmail.com (Alexei Starovoitov)
Date: Sat, 10 Nov 2018 16:00:08 -0800
Subject: [PATCH v5 bpf-next 0/7] bpftool: support loading flow dissector
In-Reply-To: <20181109121511.254dfd59@cakuba.netronome.com>
References: <20181109162146.78019-1-sdf@google.com>
 <20181109121511.254dfd59@cakuba.netronome.com>
Message-ID: <20181111000006.2oi734ijtgc4iqjz@ast-mbp.dhcp.thefacebook.com>

On Fri, Nov 09, 2018 at 12:15:11PM -0800, Jakub Kicinski wrote:
> On Fri,  9 Nov 2018 08:21:39 -0800, Stanislav Fomichev wrote:
> > v5 changes:
> > * FILE -> PATH for load/loadall (can be either file or directory now)
> > * simpler implementation for __bpf_program__pin_name
> > * removed p_err for REQ_ARGS checks
> > * parse_atach_detach_args -> parse_attach_detach_args
> > * for -> while in bpf_object__pin_{programs,maps} recovery
> 
> Thanks!  Patch 3 needs attention from maintainers but the rest LGTM!

Whole thing looks good to me.
Applied, Thanks everyone
