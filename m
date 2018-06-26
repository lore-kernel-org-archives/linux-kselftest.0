From: daniel at iogearbox.net (Daniel Borkmann)
Date: Tue, 26 Jun 2018 12:22:45 +0200
Subject: [PATCH] selftests: bpf: notification about privilege required to
 run test_lirc_mode2.sh testing script
In-Reply-To: <20180622185417.3452-1-ahiliation@gmail.com>
References: <20180622185417.3452-1-ahiliation@gmail.com>
Message-ID: <382273ea-c7c7-fc48-0ca5-0b7d35f7803d@iogearbox.net>

On 06/22/2018 08:54 PM, Jeffrin Jose T wrote:
> The test_lirc_mode2.sh script require root privilege for the successful
> execution of the test.
> 
> This patch is to notify the user about the privilege the script
> demands for the successful execution of the test.
> 
> Signed-off-by: Jeffrin Jose T (Rajagiri SET) <ahiliation at gmail.com>

Applied to bpf, thanks Jeffrin!
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
