From: jakub.kicinski at netronome.com (Jakub Kicinski)
Date: Thu, 8 Nov 2018 19:50:14 -0800
Subject: [PATCH v4 bpf-next 7/7] bpftool: support loading flow dissector
In-Reply-To: <20181109002213.5914-8-s@fomichev.me>
References: <20181109002213.5914-1-s@fomichev.me>
 <20181109002213.5914-8-s@fomichev.me>
Message-ID: <20181108195014.36e61e5f@cakuba.netronome.com>

On Thu,  8 Nov 2018 16:22:13 -0800, Stanislav Fomichev wrote:
> From: Stanislav Fomichev <sdf at google.com>
> 
> This commit adds support for loading/attaching/detaching flow
> dissector program. The structure of the flow dissector program is
> assumed to be the same as in the selftests:

nit: I don't think we make any assumptions any more?  Since the
     sub-programs are added to the map explicitly by the user?

> * flow_dissector section with the main entry point
> * a bunch of tail call progs
> * a jmp_table map that is populated with the tail call progs
> 

[...]

> @@ -338,7 +339,16 @@ _bpftool()
>  
>                      case $prev in
>                          type)
> -                            COMPREPLY=( $( compgen -W "socket kprobe kretprobe classifier action tracepoint raw_tracepoint xdp perf_event cgroup/skb cgroup/sock cgroup/dev lwt_in lwt_out lwt_xmit lwt_seg6local sockops sk_skb sk_msg lirc_mode2 cgroup/bind4 cgroup/bind6 cgroup/connect4 cgroup/connect6 cgroup/sendmsg4 cgroup/sendmsg6 cgroup/post_bind4 cgroup/post_bind6" -- \
> +                            COMPREPLY=( $( compgen -W "socket kprobe \
> +                                kretprobe classifier flow_dissector \
> +                                action tracepoint raw_tracepoint \
> +                                xdp perf_event cgroup/skb cgroup/sock \
> +                                cgroup/dev lwt_in lwt_out lwt_xmit \
> +                                lwt_seg6local sockops sk_skb sk_msg \
> +                                lirc_mode2 cgroup/bind4 cgroup/bind6 \
> +                                cgroup/connect4 cgroup/connect6 \
> +                                cgroup/sendmsg4 cgroup/sendmsg6 \
> +                                cgroup/post_bind4 cgroup/post_bind6" -- \
>                                                     "$cur" ) )

Thanks! :)

>                              return 0
>                              ;;
> diff --git a/tools/bpf/bpftool/prog.c b/tools/bpf/bpftool/prog.c
> index 4654d9450cd9..b808a67d1d3e 100644
> --- a/tools/bpf/bpftool/prog.c
> +++ b/tools/bpf/bpftool/prog.c
> @@ -81,6 +81,7 @@ static const char * const attach_type_strings[] = {
>  	[BPF_SK_SKB_STREAM_PARSER] = "stream_parser",
>  	[BPF_SK_SKB_STREAM_VERDICT] = "stream_verdict",
>  	[BPF_SK_MSG_VERDICT] = "msg_verdict",
> +	[BPF_FLOW_DISSECTOR] = "flow_dissector",
>  	[__MAX_BPF_ATTACH_TYPE] = NULL,
>  };
>  
> @@ -721,30 +722,53 @@ int map_replace_compar(const void *p1, const void *p2)
>  	return a->idx - b->idx;
>  }
>  
> -static int do_attach(int argc, char **argv)
> +static int parse_atach_detach_args(int argc, char **argv, int *progfd,
> +				   enum bpf_attach_type *attach_type,
> +				   int *mapfd)
>  {
> -	enum bpf_attach_type attach_type;
> -	int err, mapfd, progfd;
> -
> -	if (!REQ_ARGS(5)) {
> -		p_err("too few parameters for map attach");
> +	if (!REQ_ARGS(3)) {
> +		p_err("too few parameters for attach/detach");

I know this is not existing bug but we didn't catch it when
attach/ /detach was added :(  - REQ_ARGS() already includes a p_err(),
so we would have a duplicate error in JSON.  Please drop the error here
and below.

With that fix:

Acked-by: Jakub Kicinski <jakub.kicinski at netronome.com>

Thanks for the work!

>  		return -EINVAL;
>  	}
>  
> -	progfd = prog_parse_fd(&argc, &argv);
> -	if (progfd < 0)
> -		return progfd;
> +	*progfd = prog_parse_fd(&argc, &argv);
> +	if (*progfd < 0)
> +		return *progfd;
>  
> -	attach_type = parse_attach_type(*argv);
> -	if (attach_type == __MAX_BPF_ATTACH_TYPE) {
> -		p_err("invalid attach type");
> +	*attach_type = parse_attach_type(*argv);
> +	if (*attach_type == __MAX_BPF_ATTACH_TYPE) {
> +		p_err("invalid attach/detach type");
>  		return -EINVAL;
>  	}
> +
> +	if (*attach_type == BPF_FLOW_DISSECTOR) {
> +		*mapfd = -1;
> +		return 0;
> +	}
> +
>  	NEXT_ARG();
> +	if (!REQ_ARGS(2)) {
> +		p_err("too few parameters for map attach/detach");
> +		return -EINVAL;
> +	}
>  
> -	mapfd = map_parse_fd(&argc, &argv);
> -	if (mapfd < 0)
> -		return mapfd;
> +	*mapfd = map_parse_fd(&argc, &argv);
> +	if (*mapfd < 0)
> +		return *mapfd;
> +
> +	return 0;
> +}
> +
