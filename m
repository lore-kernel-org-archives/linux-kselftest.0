From: pablo at netfilter.org (Pablo Neira Ayuso)
Date: Mon, 4 Feb 2019 14:21:55 +0100
Subject: [PATCH] selftests/netfilter: fix config fragment
 CONFIG_NF_TABLES_INET
In-Reply-To: <20190129062835.31122-1-naresh.kamboju@linaro.org>
References: <20190129062835.31122-1-naresh.kamboju@linaro.org>
Message-ID: <20190204132155.wigblmuifkibg6dk@salvia>

On Tue, Jan 29, 2019 at 06:28:35AM +0000, Naresh Kamboju wrote:
> In selftests the config fragment for netfilter was added as
> NF_TABLES_INET=y and this patch correct it as CONFIG_NF_TABLES_INET=y

Applied, thanks.
