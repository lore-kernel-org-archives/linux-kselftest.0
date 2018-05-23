From: daniel@iogearbox.net (Daniel Borkmann)
Date: Wed, 23 May 2018 12:29:25 +0200
Subject: [PATCH v2] selftests: net: reuseport_bpf_numa: don't fail if no
 numa support
In-Reply-To: <20180518222737.16006-1-anders.roxell@linaro.org>
References: <20180306151004.31336-1-anders.roxell@linaro.org>
 <20180518222737.16006-1-anders.roxell@linaro.org>
Message-ID: <ce493dd7-5813-6676-9e6b-7a97e74e7676@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180523102925.Xt4eoedaJLz5-yCXpZotNoVw2gGGxXEj374cXVxqvcA@z>

On 05/19/2018 12:27 AM, Anders Roxell wrote:
> The reuseport_bpf_numa test case fails there's no numa support.  The
> test shouldn't fail if there's no support it should be skipped.
> 
> Fixes: 3c2c3c16aaf6 ("reuseport, bpf: add test case for bpf_get_numa_node_id")
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>

Applied to bpf tree, thanks Anders!
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
