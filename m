From: kafai@fb.com (Martin Lau)
Date: Mon, 12 Nov 2018 21:53:39 +0000
Subject: [PATCH v5 bpf-next 2/7] libbpf: cleanup after partial failure in
 bpf_object__pin
In-Reply-To: <20181109162146.78019-3-sdf@google.com>
References: <20181109162146.78019-1-sdf@google.com>
 <20181109162146.78019-3-sdf@google.com>
Message-ID: <20181112215337.5ztvb5v7cf4kzr2h@kafai-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181112215339.yJBZhVsrnPAjSYfNeKfoFott5xNQ2kHAZZG42viccZw@z>

On Fri, Nov 09, 2018@08:21:41AM -0800, Stanislav Fomichev wrote:
[ ... ]
> @@ -1918,23 +2160,20 @@ void *bpf_object__priv(struct bpf_object *obj)
>  }
>  
>  static struct bpf_program *
> -__bpf_program__next(struct bpf_program *prev, struct bpf_object *obj)
> +__bpf_program__iter(struct bpf_program *p, struct bpf_object *obj, int i)
>  {
> -	size_t idx;
> +	ssize_t idx;
>  
>  	if (!obj->programs)
>  		return NULL;
> -	/* First handler */
> -	if (prev == NULL)
> -		return &obj->programs[0];
>  
> -	if (prev->obj != obj) {
> +	if (p->obj != obj) {
>  		pr_warning("error: program handler doesn't match object\n");
>  		return NULL;
>  	}
>  
> -	idx = (prev - obj->programs) + 1;
> -	if (idx >= obj->nr_programs)
> +	idx = (p - obj->programs) + i;
> +	if (idx >= obj->nr_programs || idx < 0)
>  		return NULL;
>  	return &obj->programs[idx];
>  }
> @@ -1944,8 +2183,29 @@ bpf_program__next(struct bpf_program *prev, struct bpf_object *obj)
>  {
>  	struct bpf_program *prog = prev;
>  
> +	if (prev == NULL)
> +		return obj->programs;
> +
This patch breaks the behavior introduced in
commit eac7d84519a3 ("tools: libbpf: don't return '.text' as a program for multi-function programs"):
"Make bpf_program__next() skip over '.text' section if object file
 has pseudo calls.  The '.text' section is hardly a program in that
 case, it's more of a storage for code of functions other than main."

For example, the userspace could have been doing:
	prog = bpf_program__next(NULL, obj);
	bpf_program__set_type(prog, BPF_PROG_TYPE_TRACEPOINT);
	bpf_object__load(obj);

For the bpf_prog.o that has pseudo calls, after this patch in bpf-next,
the prog returned by bpf_program__next() could be in ".text" instead of
the main bpf program.  The next bpf_program__set_type() has
no effect to the main program.  The following bpf_object__load()
will catch user in surprise with the main bpf prog in
the wrong BPF_PROG_TYPE.


>  	do {
> -		prog = __bpf_program__next(prog, obj);
> +		prog = __bpf_program__iter(prog, obj, 1);
> +	} while (prog && bpf_program__is_function_storage(prog, obj));
> +
> +	return prog;
> +}
> +
> +struct bpf_program *
> +bpf_program__prev(struct bpf_program *next, struct bpf_object *obj)
> +{
> +	struct bpf_program *prog = next;
> +
> +	if (next == NULL) {
> +		if (!obj->nr_programs)
> +			return NULL;
> +		return obj->programs + obj->nr_programs - 1;
> +	}
> +
> +	do {
> +		prog = __bpf_program__iter(prog, obj, -1);
>  	} while (prog && bpf_program__is_function_storage(prog, obj));
>  
>  	return prog;
