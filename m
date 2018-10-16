From: joe at perches.com (Joe Perches)
Date: Tue, 16 Oct 2018 16:59:26 -0700
Subject: [RFC v1 12/31] checkpatch: added support for struct MOCK(foo)
 syntax
In-Reply-To: <20181016235120.138227-13-brendanhiggins@google.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
 <20181016235120.138227-13-brendanhiggins@google.com>
Message-ID: <bad13afe8c71860a85f12130a57fe9a96f017cf3.camel@perches.com>

On Tue, 2018-10-16 at 16:51 -0700, Brendan Higgins wrote:
> This adds struct MOCK(foo) as a NonptrType so that it is recognized
> correctly in declarations.

I think this commit message is lacking context.


> Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
> ---
>  scripts/checkpatch.pl | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 447857ffaf6be..9806f190796de 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -745,6 +745,10 @@ sub build_types {
>  			(?:
>  				(?:typeof|__typeof__)\s*\([^\)]*\)|
>  				(?:$typeTypedefs\b)|
> +				# Matching a \b breaks struct MOCK(foo) syntax,
> +				# so we need to have it not lumped in with the
> +				# types in @typeList.
> +				(?:struct\s+MOCK\($Ident\))|
>  				(?:${all}\b)
>  			)
>  			(?:\s+$Modifier|\s+const)*
