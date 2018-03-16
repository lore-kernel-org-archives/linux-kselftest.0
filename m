From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Fri, 16 Mar 2018 23:48:52 +0900
Subject: [PATCH v5 16/19] tracing: probeevent: Add array type support
In-Reply-To: <152049905133.7289.17516121776689315422.stgit@devbox>
References: <152049860385.7289.14079393589900496424.stgit@devbox>
 <152049905133.7289.17516121776689315422.stgit@devbox>
Message-ID: <20180316234852.530b7831ee6e242e3b535a16@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180316144852.lpnA1nUkRQE0oH0pJm8iYsfA4a5jpc_0HXm473koLbs@z>

On Thu,  8 Mar 2018 17:50:51 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Add array type support for probe events.
> This allows user to get arraied types from memory address.
> The array type syntax is
> 
> 	TYPE[N]
> 
> Where TYPE is one of types (u8/16/32/64,s8/16/32/64,
> x8/16/32/64, symbol, string) and N is a fixed value less
> than 64.
> 
> The string array type is a bit different from other types. For
> other base types, <base-type>[1] is equal to <base-type>
> (e.g. +0(%di):x32[1] is same as +0(%di):x32.) But string[1] is not
> equal to string. The string type itself represents "char array",
> but string array type represents "char * array". So, for example,
> +0(%di):string[1] is equal to +0(+0(%di)):string.
> 
> Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
> ---
>  Changes in v4:
>   - Fix to use calculated size correctly for field definition.
>     (Thank you Namhyung!)
>  Changes in v2:
>   - Add array description in README file
>   - Fix to init s3 code out of loop.
>   - Fix to proceed code when the last code is OP_ARRAY.
>   - Add string array type and bitfield array type.
> ---
>  Documentation/trace/kprobetrace.txt |   13 ++++
>  kernel/trace/trace.c                |    3 +
>  kernel/trace/trace_probe.c          |  130 +++++++++++++++++++++++++++--------
>  kernel/trace/trace_probe.h          |   14 ++++
>  kernel/trace/trace_probe_tmpl.h     |   63 +++++++++++++++--
>  5 files changed, 183 insertions(+), 40 deletions(-)
> 
> diff --git a/Documentation/trace/kprobetrace.txt b/Documentation/trace/kprobetrace.txt
> index 1d082f8ffeee..8bf752dfc072 100644
> --- a/Documentation/trace/kprobetrace.txt
> +++ b/Documentation/trace/kprobetrace.txt
> @@ -65,9 +65,22 @@ in decimal ('s' and 'u') or hexadecimal ('x'). Without type casting, 'x32'
>  or 'x64' is used depends on the architecture (e.g. x86-32 uses x32, and
>  x86-64 uses x64).
>  
> +These value types can be an array. To record array data, you can add '[N]'
> +(where N is a fixed number, less than 64) to the base type.
> +E.g. 'x16[4]' means an array of x16 (2bytes hex) with 4 elements.
> +Note that the array can be applied to memory type fetchargs, you can not
> +apply it to registers/stack-entries etc. (for example, '$stack1:x8[8]' is
> +wrong, but '+8($stack):x8[8]' is OK.)
> +
>  String type is a special type, which fetches a "null-terminated" string from
>  kernel space. This means it will fail and store NULL if the string container
>  has been paged out.
> +The string array type is a bit different from other types. For other base
> +types, <base-type>[1] is equal to <base-type> (e.g. +0(%di):x32[1] is same
> +as +0(%di):x32.) But string[1] is not equal to string. The string type itself
> +represents "char array", but string array type represents "char * array".
> +So, for example, +0(%di):string[1] is equal to +0(+0(%di)):string.
> +
>  Bitfield is another special type, which takes 3 parameters, bit-width, bit-
>  offset, and container-size (usually 32). The syntax is;
>  
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index bcd1fd87082d..b7c6698265e5 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -4614,7 +4614,8 @@ static const char readme_msg[] =
>  	"\t           $stack<index>, $stack, $retval, $comm\n"
>  #endif
>  	"\t     type: s8/16/32/64, u8/16/32/64, x8/16/32/64, string, symbol,\n"
> -	"\t           b<bit-width>@<bit-offset>/<container-size>\n"
> +	"\t           b<bit-width>@<bit-offset>/<container-size>,\n"
> +	"\t           <type>[<array-size>]\n"

Ah, this brace('[',']') should be escaped, like "<type>\[<array-size>\]", or we can not
distinguish it from other braces which mean "optional" syntax.
I'll update it in the next version.

Thanks,

-- 
Masami Hiramatsu <mhiramat at kernel.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
