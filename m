From: jakub.kicinski at netronome.com (Jakub Kicinski)
Date: Thu, 8 Nov 2018 19:38:56 -0800
Subject: [PATCH v4 bpf-next 4/7] libbpf: add internal pin_name
In-Reply-To: <20181109002213.5914-5-s@fomichev.me>
References: <20181109002213.5914-1-s@fomichev.me>
 <20181109002213.5914-5-s@fomichev.me>
Message-ID: <20181108193712.754659d7@cakuba.netronome.com>

On Thu,  8 Nov 2018 16:22:10 -0800, Stanislav Fomichev wrote:
> @@ -261,6 +266,18 @@ static void bpf_program__exit(struct bpf_program *prog)
>  	prog->idx = -1;
>  }
>  
> +static char *__bpf_program__pin_name(struct bpf_program *prog)
> +{
> +	char *name;
> +
> +	name = strdup(prog->section_name);
> +	for (char *p = name; p && *p; p++)

Useful patch!  I'm not sure about libbpf but in the kernel we don't do
C99 variable declarations inside for loop init.  Perhaps better to stick
to kernel rules than invent our own.

Also, I'm tempted to say:

	char *name, *p;

	name = p = strdup(prog->section_name);
	while ((p = strchr(p, '/')))
		*p = '_';

;)

> +		if (*p == '/')
> +			*p = '_';
> +
> +	return name;
> +}
