From: shuah@kernel.org (Shuah Khan)
Date: Wed, 18 Apr 2018 08:48:13 -0600
Subject: [PATCH] doc: dev-tools: kselftest.rst: update contributing new
 tests
In-Reply-To: <20180417084631.11242-1-anders.roxell@linaro.org>
References: <20180417084631.11242-1-anders.roxell@linaro.org>
Message-ID: <cbea46f8-7d30-8298-b830-c6f2a4453101@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180418144813.3LYDIwuNe3Uw3O0rk8C8KsKNaL6aMxsxtjiM5K4sDo0@z>

On 04/17/2018 02:46 AM, Anders Roxell wrote:
> Add a description that the kernel headers should be used as far as it is
> possible and then the system headers.
> 
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> ---
>  Documentation/dev-tools/kselftest.rst | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
> index e80850eefe13..27f08d6ba91c 100644
> --- a/Documentation/dev-tools/kselftest.rst
> +++ b/Documentation/dev-tools/kselftest.rst
> @@ -151,6 +151,9 @@ Contributing new tests (details)
>     TEST_FILES, TEST_GEN_FILES mean it is the file which is used by
>     test.
>  
> + * First use the headers inside the kernel, and then the system headers. The
> +   internal headers should be the primary focus to be able to find regressions.

Clarifying the location of the headers might be helpful. This description uses
different terminology to describe kernel headers.

"First use the headers inside the kernel sources and/or git reo" would make this
clear. Instead of "internal headers" headers for the kernel release as opposed
to headers installed by the distro on the system would make a clear distinction.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
