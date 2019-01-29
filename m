From: fw at strlen.de (Florian Westphal)
Date: Tue, 29 Jan 2019 08:59:53 +0100
Subject: [PATCH] selftests/netfilter: fix config fragment
 CONFIG_NF_TABLES_INET
In-Reply-To: <20190129062835.31122-1-naresh.kamboju@linaro.org>
References: <20190129062835.31122-1-naresh.kamboju@linaro.org>
Message-ID: <20190129075953.j5qogpvmqalkukoo@breakpoint.cc>

Naresh Kamboju <naresh.kamboju at linaro.org> wrote:
> In selftests the config fragment for netfilter was added as
> NF_TABLES_INET=y and this patch correct it as CONFIG_NF_TABLES_INET=y

Oh, silly me.  Thanks for fixing this up.

Acked-by: Florian Westphal <fw at strlen.de>
