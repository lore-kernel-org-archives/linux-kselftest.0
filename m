From: quentin.monnet@netronome.com (Quentin Monnet)
Date: Thu, 8 Nov 2018 18:21:24 +0000
Subject: [PATCH v3 bpf-next 4/4] bpftool: support loading flow dissector
In-Reply-To: <20181108180153.tbssxcgkkq5xcdxc@mini-arch>
References: <20181108053957.205681-1-sdf@google.com>
 <20181108053957.205681-5-sdf@google.com>
 <8c35340e-3ed7-70cd-3123-7cd0fb8824a7@netronome.com>
 <20181108180153.tbssxcgkkq5xcdxc@mini-arch>
Message-ID: <d61e20cb-ccb1-1502-3119-8f71fb8d3570@netronome.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181108182124.Kv-tvuKDjlpkbzmj8AlGCT9mlFZOqgAnffYSqXuVjAM@z>

2018-11-08 10:01 UTC-0800 ~ Stanislav Fomichev <sdf at fomichev.me>
> On 11/08, Quentin Monnet wrote:
>> Hi Stanislav, thanks for the changes! More comments below.
> Thank you for another round of review!
> 
>> 2018-11-07 21:39 UTC-0800 ~ Stanislav Fomichev <sdf at google.com>
>>> This commit adds support for loading/attaching/detaching flow
>>> dissector program. The structure of the flow dissector program is
>>> assumed to be the same as in the selftests:
>>>
>>> * flow_dissector section with the main entry point
>>> * a bunch of tail call progs
>>> * a jmp_table map that is populated with the tail call progs
>>>
>>> When `bpftool load` is called with a flow_dissector prog (i.e. when the
>>> first section is flow_dissector of 'type flow_dissector' argument is
>>> passed), we load and pin all the programs/maps. User is responsible to
>>> construct the jump table for the tail calls.
>>>
>>> The last argument of `bpftool attach` is made optional for this use
>>> case.
>>>
>>> Example:
>>> bpftool prog load tools/testing/selftests/bpf/bpf_flow.o \
>>> 	/sys/fs/bpf/flow type flow_dissector
>>>
>>> bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
>>>          key 0 0 0 0 \
>>>          value pinned /sys/fs/bpf/flow/IP
>>>
>>> bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
>>>          key 1 0 0 0 \
>>>          value pinned /sys/fs/bpf/flow/IPV6
>>>
>>> bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
>>>          key 2 0 0 0 \
>>>          value pinned /sys/fs/bpf/flow/IPV6OP
>>>
>>> bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
>>>          key 3 0 0 0 \
>>>          value pinned /sys/fs/bpf/flow/IPV6FR
>>>
>>> bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
>>>          key 4 0 0 0 \
>>>          value pinned /sys/fs/bpf/flow/MPLS
>>>
>>> bpftool map update pinned /sys/fs/bpf/flow/jmp_table \
>>>          key 5 0 0 0 \
>>>          value pinned /sys/fs/bpf/flow/VLAN
>>>
>>> bpftool prog attach pinned /sys/fs/bpf/flow/flow_dissector flow_dissector
>>>
>>> Tested by using the above lines to load the prog in
>>> the test_flow_dissector.sh selftest.
>>>
>>> Signed-off-by: Stanislav Fomichev <sdf at google.com>
>>> ---
>>>   .../bpftool/Documentation/bpftool-prog.rst    |  36 ++++--
>>>   tools/bpf/bpftool/bash-completion/bpftool     |   6 +-
>>>   tools/bpf/bpftool/common.c                    |  30 ++---
>>>   tools/bpf/bpftool/main.h                      |   1 +
>>>   tools/bpf/bpftool/prog.c                      | 112 +++++++++++++-----
>>>   5 files changed, 126 insertions(+), 59 deletions(-)
>>>
>>> diff --git a/tools/bpf/bpftool/Documentation/bpftool-prog.rst b/tools/bpf/bpftool/Documentation/bpftool-prog.rst
>>> index ac4e904b10fb..0374634c3087 100644
>>> --- a/tools/bpf/bpftool/Documentation/bpftool-prog.rst
>>> +++ b/tools/bpf/bpftool/Documentation/bpftool-prog.rst
>>> @@ -15,7 +15,8 @@ SYNOPSIS
>>>   	*OPTIONS* := { { **-j** | **--json** } [{ **-p** | **--pretty** }] | { **-f** | **--bpffs** } }
>>>   	*COMMANDS* :=
>>> -	{ **show** | **list** | **dump xlated** | **dump jited** | **pin** | **load** | **help** }
>>> +	{ **show** | **list** | **dump xlated** | **dump jited** | **pin** | **load**
>>> +	| **loadall** | **help** }
>>>   MAP COMMANDS
>>>   =============
>>> @@ -24,9 +25,9 @@ MAP COMMANDS
>>>   |	**bpftool** **prog dump xlated** *PROG* [{**file** *FILE* | **opcodes** | **visual**}]
>>>   |	**bpftool** **prog dump jited**  *PROG* [{**file** *FILE* | **opcodes**}]
>>>   |	**bpftool** **prog pin** *PROG* *FILE*
>>> -|	**bpftool** **prog load** *OBJ* *FILE* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*]
>>> -|       **bpftool** **prog attach** *PROG* *ATTACH_TYPE* *MAP*
>>> -|       **bpftool** **prog detach** *PROG* *ATTACH_TYPE* *MAP*
>>> +|	**bpftool** **prog { load | loadall }** *OBJ* *FILE* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*]
>>> +|       **bpftool** **prog attach** *PROG* *ATTACH_TYPE* [*MAP*]
>>> +|       **bpftool** **prog detach** *PROG* *ATTACH_TYPE* [*MAP*]
>>>   |	**bpftool** **prog help**
>>>   |
>>>   |	*MAP* := { **id** *MAP_ID* | **pinned** *FILE* }
>>> @@ -39,7 +40,9 @@ MAP COMMANDS
>>>   |		**cgroup/bind4** | **cgroup/bind6** | **cgroup/post_bind4** | **cgroup/post_bind6** |
>>>   |		**cgroup/connect4** | **cgroup/connect6** | **cgroup/sendmsg4** | **cgroup/sendmsg6**
>>>   |	}
>>> -|       *ATTACH_TYPE* := { **msg_verdict** | **skb_verdict** | **skb_parse** }
>>> +|       *ATTACH_TYPE* := {
>>> +|		**msg_verdict** | **skb_verdict** | **skb_parse** | **flow_dissector**
>>> +|	}
>>>   DESCRIPTION
>>> @@ -79,8 +82,11 @@ DESCRIPTION
>>>   		  contain a dot character ('.'), which is reserved for future
>>>   		  extensions of *bpffs*.
>>> -	**bpftool prog load** *OBJ* *FILE* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*]
>>> +	**bpftool prog { load | loadall }** *OBJ* *FILE* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*]
>>>   		  Load bpf program from binary *OBJ* and pin as *FILE*.
>>> +		  **bpftool prog load** will pin only the first bpf program
>>> +		  from the *OBJ*, **bpftool prog loadall** will pin all maps
>>> +		  and programs from the *OBJ*.
>>
>> This could be improved regarding maps: with "bpftool prog load" I think we
>> also load and pin all maps, but your description implies this is only the
>> case with "loadall"
> I don't think we pin any maps with `bpftool prog load`, we certainly load
> them, but we don't pin any afaict. Can you point me to the code where we
> pin the maps?
> 

My bad. I read "pin" but thought "load". It does not pin them indeed,
sorry about that.

>>>   		  **type** is optional, if not specified program type will be
>>>   		  inferred from section names.
>>>   		  By default bpftool will create new maps as declared in the ELF
>>> @@ -97,13 +103,17 @@ DESCRIPTION
>>>   		  contain a dot character ('.'), which is reserved for future
>>>   		  extensions of *bpffs*.
>>> -        **bpftool prog attach** *PROG* *ATTACH_TYPE* *MAP*
>>> -                  Attach bpf program *PROG* (with type specified by *ATTACH_TYPE*)
>>> -                  to the map *MAP*.
>>> -
>>> -        **bpftool prog detach** *PROG* *ATTACH_TYPE* *MAP*
>>> -                  Detach bpf program *PROG* (with type specified by *ATTACH_TYPE*)
>>> -                  from the map *MAP*.
>>> +        **bpftool prog attach** *PROG* *ATTACH_TYPE* [*MAP*]
>>> +                  Attach bpf program *PROG* (with type specified by
>>> +                  *ATTACH_TYPE*). Most *ATTACH_TYPEs* require a *MAP*
>>> +                  parameter, with the exception of *flow_dissector* which is
>>> +                  attached to current networking name space.
>>> +
>>> +        **bpftool prog detach** *PROG* *ATTACH_TYPE* [*MAP*]
>>> +                  Detach bpf program *PROG* (with type specified by
>>> +                  *ATTACH_TYPE*). Most *ATTACH_TYPEs* require a *MAP*
>>> +                  parameter, with the exception of *flow_dissector* which is
>>> +                  detached from the current networking name space.
>>
>> While at it could you please fix those two paragraphs to use tabs for
>> indentation, as the rest of the doc? Thanks!
> Time to teach my vim to use tabs in .rst files. Sorry about that.

Those paragraphs were using spaces already, so you didn't introduce that
:). But all others use tabs so its a good occasion to fix it.

>>>   	**bpftool prog help**
>>>   		  Print short help message.
>>> diff --git a/tools/bpf/bpftool/bash-completion/bpftool b/tools/bpf/bpftool/bash-completion/bpftool
>>> index 3f78e6404589..ad0fc919f7ec 100644
>>> --- a/tools/bpf/bpftool/bash-completion/bpftool
>>> +++ b/tools/bpf/bpftool/bash-completion/bpftool
>>> @@ -243,7 +243,7 @@ _bpftool()
>>>       # Completion depends on object and command in use
>>>       case $object in
>>>           prog)
>>> -            if [[ $command != "load" ]]; then
>>> +            if [[ $command != "load" && $command != "loadall" ]]; then
>>>                   case $prev in
>>>                       id)
>>>                           _bpftool_get_prog_ids
>>> @@ -299,7 +299,7 @@ _bpftool()
>>>                       fi
>>>                       if [[ ${#words[@]} == 6 ]]; then
>>> -                        COMPREPLY=( $( compgen -W "msg_verdict skb_verdict skb_parse" -- "$cur" ) )
>>> +                        COMPREPLY=( $( compgen -W "msg_verdict skb_verdict skb_parse flow_dissector" -- "$cur" ) )
>>>                           return 0
>>>                       fi
>>> @@ -309,7 +309,7 @@ _bpftool()
>>>                       fi
>>>                       return 0
>>>                       ;;
>>> -                load)
>>> +                load|loadall)
>>>                       local obj
>>>                       if [[ ${#words[@]} -lt 6 ]]; then
>>
>> You also want to update completion for the program types, at line 341 or so.
>> Feel free to split that list on several lines, by the way :).
> Will do, thanks!
> 
>>> diff --git a/tools/bpf/bpftool/common.c b/tools/bpf/bpftool/common.c
>>> index 25af85304ebe..f671a921dec5 100644
>>> --- a/tools/bpf/bpftool/common.c
>>> +++ b/tools/bpf/bpftool/common.c
>>> @@ -169,34 +169,24 @@ int open_obj_pinned_any(char *path, enum bpf_obj_type exp_type)
>>>   	return fd;
>>>   }
>>> -int do_pin_fd(int fd, const char *name)
>>> +int mount_bpffs_for_pin(const char *name)
>>>   {
>>>   	char err_str[ERR_MAX_LEN];
>>>   	char *file;
>>>   	char *dir;
>>>   	int err = 0;
>>> -	err = bpf_obj_pin(fd, name);
>>> -	if (!err)
>>> -		goto out;
>>> -
>>>   	file = malloc(strlen(name) + 1);
>>>   	strcpy(file, name);
>>>   	dir = dirname(file);
>>> -	if (errno != EPERM || is_bpffs(dir)) {
>>> -		p_err("can't pin the object (%s): %s", name, strerror(errno));
>>> +	if (is_bpffs(dir)) {
>>> +		/* nothing to do if already mounted */
>>>   		goto out_free;
>>>   	}
>>
>> Nitpick: unnecessary brackets.
> Ack.
> 
>>> -	/* Attempt to mount bpffs, then retry pinning. */
>>>   	err = mnt_bpffs(dir, err_str, ERR_MAX_LEN);
>>> -	if (!err) {
>>> -		err = bpf_obj_pin(fd, name);
>>> -		if (err)
>>> -			p_err("can't pin the object (%s): %s", name,
>>> -			      strerror(errno));
>>> -	} else {
>>> +	if (err) {
>>>   		err_str[ERR_MAX_LEN - 1] = '\0';
>>>   		p_err("can't mount BPF file system to pin the object (%s): %s",
>>>   		      name, err_str);
>>> @@ -204,10 +194,20 @@ int do_pin_fd(int fd, const char *name)
>>>   out_free:
>>>   	free(file);
>>> -out:
>>>   	return err;
>>>   }
>>> +int do_pin_fd(int fd, const char *name)
>>> +{
>>> +	int err;
>>> +
>>> +	err = mount_bpffs_for_pin(name);
>>> +	if (err)
>>> +		return err;
>>> +
>>> +	return bpf_obj_pin(fd, name);
>>> +}
>>> +
>>>   int do_pin_any(int argc, char **argv, int (*get_fd_by_id)(__u32))
>>>   {
>>>   	unsigned int id;
>>> diff --git a/tools/bpf/bpftool/main.h b/tools/bpf/bpftool/main.h
>>> index 28322ace2856..1383824c9baf 100644
>>> --- a/tools/bpf/bpftool/main.h
>>> +++ b/tools/bpf/bpftool/main.h
>>> @@ -129,6 +129,7 @@ const char *get_fd_type_name(enum bpf_obj_type type);
>>>   char *get_fdinfo(int fd, const char *key);
>>>   int open_obj_pinned(char *path);
>>>   int open_obj_pinned_any(char *path, enum bpf_obj_type exp_type);
>>> +int mount_bpffs_for_pin(const char *name);
>>>   int do_pin_any(int argc, char **argv, int (*get_fd_by_id)(__u32));
>>>   int do_pin_fd(int fd, const char *name);
>>> diff --git a/tools/bpf/bpftool/prog.c b/tools/bpf/bpftool/prog.c
>>> index 5302ee282409..a4346dd673b1 100644
>>> --- a/tools/bpf/bpftool/prog.c
>>> +++ b/tools/bpf/bpftool/prog.c
>>> @@ -81,6 +81,7 @@ static const char * const attach_type_strings[] = {
>>>   	[BPF_SK_SKB_STREAM_PARSER] = "stream_parser",
>>>   	[BPF_SK_SKB_STREAM_VERDICT] = "stream_verdict",
>>>   	[BPF_SK_MSG_VERDICT] = "msg_verdict",
>>> +	[BPF_FLOW_DISSECTOR] = "flow_dissector",
>>>   	[__MAX_BPF_ATTACH_TYPE] = NULL,
>>>   };
>>> @@ -724,10 +725,11 @@ int map_replace_compar(const void *p1, const void *p2)
>>>   static int do_attach(int argc, char **argv)
>>>   {
>>>   	enum bpf_attach_type attach_type;
>>> -	int err, mapfd, progfd;
>>> +	int err, progfd;
>>> +	int mapfd = 0;
>>> -	if (!REQ_ARGS(5)) {
>>> -		p_err("too few parameters for map attach");
>>> +	if (!REQ_ARGS(3)) {
>>> +		p_err("too few parameters for attach");
>>>   		return -EINVAL;
>>>   	}
>>> @@ -740,11 +742,17 @@ static int do_attach(int argc, char **argv)
>>>   		p_err("invalid attach type");
>>>   		return -EINVAL;
>>>   	}
>>> -	NEXT_ARG();
>>> +	if (attach_type != BPF_FLOW_DISSECTOR) {
>>> +		NEXT_ARG();
>>> +		if (!REQ_ARGS(2)) {
>>> +			p_err("too few parameters for map attach");
>>> +			return -EINVAL;
>>> +		}
>>> -	mapfd = map_parse_fd(&argc, &argv);
>>> -	if (mapfd < 0)
>>> -		return mapfd;
>>> +		mapfd = map_parse_fd(&argc, &argv);
>>> +		if (mapfd < 0)
>>> +			return mapfd;
>>> +	}
>>>   	err = bpf_prog_attach(progfd, mapfd, attach_type, 0);
>>>   	if (err) {
>>> @@ -760,10 +768,11 @@ static int do_attach(int argc, char **argv)
>>>   static int do_detach(int argc, char **argv)
>>>   {
>>>   	enum bpf_attach_type attach_type;
>>> -	int err, mapfd, progfd;
>>> +	int err, progfd;
>>> +	int mapfd = 0;
>>> -	if (!REQ_ARGS(5)) {
>>> -		p_err("too few parameters for map detach");
>>> +	if (!REQ_ARGS(3)) {
>>> +		p_err("too few parameters for detach");
>>>   		return -EINVAL;
>>>   	}
>>> @@ -776,11 +785,17 @@ static int do_detach(int argc, char **argv)
>>>   		p_err("invalid attach type");
>>>   		return -EINVAL;
>>>   	}
>>> -	NEXT_ARG();
>>> +	if (attach_type != BPF_FLOW_DISSECTOR) {
>>> +		NEXT_ARG();
>>> +		if (!REQ_ARGS(2)) {
>>> +			p_err("too few parameters for map detach");
>>> +			return -EINVAL;
>>> +		}
>>
>> Would that make sense to factor argument checks or parsing for do_attach()
>> and do_detach() to some extent? In order to reduce the number of
>> attach-type-based exceptions to add in the code if we have other attach
>> types that do not take maps in the future.
> I can move all argument parsing into a new function and use it from both
> do_attach and do_detach.

Sounds good to me, thanks!

>>> -	mapfd = map_parse_fd(&argc, &argv);
>>> -	if (mapfd < 0)
>>> -		return mapfd;
>>> +		mapfd = map_parse_fd(&argc, &argv);
>>> +		if (mapfd < 0)
>>> +			return mapfd;
>>> +	}
>>>   	err = bpf_prog_detach2(progfd, mapfd, attach_type);
>>>   	if (err) {
>>> @@ -792,15 +807,16 @@ static int do_detach(int argc, char **argv)
>>>   		jsonw_null(json_wtr);
>>>   	return 0;
>>>   }
>>> -static int do_load(int argc, char **argv)
>>> +
>>> +static int load_with_options(int argc, char **argv, bool first_prog_only)
>>>   {
>>>   	enum bpf_attach_type expected_attach_type;
>>>   	struct bpf_object_open_attr attr = {
>>>   		.prog_type	= BPF_PROG_TYPE_UNSPEC,
>>>   	};
>>>   	struct map_replace *map_replace = NULL;
>>> +	struct bpf_program *prog = NULL, *pos;
>>>   	unsigned int old_map_fds = 0;
>>> -	struct bpf_program *prog;
>>>   	struct bpf_object *obj;
>>>   	struct bpf_map *map;
>>>   	const char *pinfile;
>>> @@ -918,14 +934,20 @@ static int do_load(int argc, char **argv)
>>>   		goto err_free_reuse_maps;
>>>   	}
>>> -	prog = bpf_program__next(NULL, obj);
>>> -	if (!prog) {
>>> -		p_err("object file doesn't contain any bpf program");
>>> -		goto err_close_obj;
>>> +	if (first_prog_only) {
>>> +		prog = bpf_program__next(NULL, obj);
>>> +		if (!prog) {
>>> +			p_err("object file doesn't contain any bpf program");
>>> +			goto err_close_obj;
>>> +		}
>>>   	}
>>> -	bpf_program__set_ifindex(prog, ifindex);
>>>   	if (attr.prog_type == BPF_PROG_TYPE_UNSPEC) {
>>> +		if (!prog) {
>>> +			p_err("can not guess program type when loading all programs\n");
>>> +			goto err_close_obj;
>>> +		}
>>> +
>>>   		const char *sec_name = bpf_program__title(prog, false);
>>>   		err = libbpf_prog_type_by_name(sec_name, &attr.prog_type,
>>> @@ -936,8 +958,13 @@ static int do_load(int argc, char **argv)
>>>   			goto err_close_obj;
>>>   		}
>>>   	}
>>> -	bpf_program__set_type(prog, attr.prog_type);
>>> -	bpf_program__set_expected_attach_type(prog, expected_attach_type);
>>> +
>>> +	bpf_object__for_each_program(pos, obj) {
>>> +		bpf_program__set_ifindex(pos, ifindex);
>>> +		bpf_program__set_type(pos, attr.prog_type);
>>> +		bpf_program__set_expected_attach_type(pos,
>>> +						      expected_attach_type);
>>> +	}
>>
>> I still believe you can have programs of different types here, and be able
>> to load them. I tried it and managed to have it working fine. If no type is
>> provided from command line we can retrieve types for each program from its
>> section name. If a type is provided on the command line, we can do the same,
>> but I am not sure we should do it, or impose that type for all programs
>> instead.
> I can move auto-detection into this new bpf_object__for_each_program
> loop. So if no type is specified, try to infer the type from each prog
> section name, otherwise, use the provided one for all progs. Do we want
> something like that?

This is what I have in mind. But others may disagree.

> Btw, do you have some existing real life example of where it's needed so
> I can test this new implementation? (maybe something under samples/ ?)

I thought about an ELF file containing both an XDP and a TC classifier
program for example. XDP can mark programs for TC, then TC process them
with all the facilities we have for skbs. It does not _have_ to be in
the same ELF file, but could be.

I haven't searched samples/bpf/ in depth, but a grep on SEC shows a
couple of files with several types (kprobe/kretprobe, classifier/xdp).
samples/bpf/xdp2skb_meta_kern.c looks like a good candidate. Or actually
for testing purposes, I simply used the following:

	#define SEC(NAME) __attribute__((section(NAME), used))

	int _version SEC("version") = 1;

	SEC("classifier")
	int func()
	{
		return 1;
	}

	SEC("xdp")
	int funcbar()
	{
		return 0;
	}

>>>   	qsort(map_replace, old_map_fds, sizeof(*map_replace),
>>>   	      map_replace_compar);
>>> @@ -1001,9 +1028,25 @@ static int do_load(int argc, char **argv)
>>>   		goto err_close_obj;
>>>   	}
>>> -	if (do_pin_fd(bpf_program__fd(prog), pinfile))
>>> +	err = mount_bpffs_for_pin(pinfile);
>>> +	if (err)
>>>   		goto err_close_obj;
>>> +	if (prog) {
>>
>> Nit: Maybe "if (first_prog_only) {" instead? If I understand correctly, at
>> this stage it should be equivalent, but in my opinion it would make it
>> easier to understand why we have two cases here.
> Sure, I can do that if you think that's more readable, I don't have a
> preference.

Thanks!
Quentin

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 801 bytes
Desc: OpenPGP digital signature
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181108/b15e0ad6/attachment.sig>
