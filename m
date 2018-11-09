From: jakub.kicinski at netronome.com (Jakub Kicinski)
Date: Thu, 8 Nov 2018 19:41:19 -0800
Subject: [PATCH v4 bpf-next 5/7] bpftool: add loadall command
In-Reply-To: <20181109002213.5914-6-s@fomichev.me>
References: <20181109002213.5914-1-s@fomichev.me>
 <20181109002213.5914-6-s@fomichev.me>
Message-ID: <20181108194119.0c75343e@cakuba.netronome.com>

On Thu,  8 Nov 2018 16:22:11 -0800, Stanislav Fomichev wrote:
> @@ -79,8 +80,13 @@ DESCRIPTION
>  		  contain a dot character ('.'), which is reserved for future
>  		  extensions of *bpffs*.
>  
> -	**bpftool prog load** *OBJ* *FILE* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*]
> -		  Load bpf program from binary *OBJ* and pin as *FILE*.
> +	**bpftool prog { load | loadall }** *OBJ* *FILE* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*]
> +		  Load bpf program(s) from binary *OBJ* and pin as *FILE*.
> +		  Both **bpftool prog load** and **bpftool prog loadall** load
> +		  all maps and programs from the *OBJ* and differ only in
> +		  pinning. **load** pins only the first program from the *OBJ*
> +		  as *FILE*. **loadall** pins all programs from the *OBJ*
> +		  under *FILE* directory.
>  		  **type** is optional, if not specified program type will be
>  		  inferred from section names.
>  		  By default bpftool will create new maps as declared in the ELF

As I said the fact that we load all always is a libbpf limitation, 
I wouldn't put it in documentation as it may change.

With that removed looks good to me:

Acked-by: Jakub Kicinski <jakub.kicinski at netronome.com>
