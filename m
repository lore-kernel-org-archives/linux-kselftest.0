From: daniel@iogearbox.net (Daniel Borkmann)
Date: Wed, 25 Jul 2018 07:53:34 +0200
Subject: [PATCH v2] bpf: Add Python 3 support to selftests scripts for bpf
In-Reply-To: <20180724195334.13965-1-jcline@redhat.com>
References: <20180724195334.13965-1-jcline@redhat.com>
Message-ID: <9f26bdd3-080f-2bd2-78cb-cd9c66d390c4@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180725055334.E4W0h7SrMieSHNcsKjpII83-Tr7K4NFOTSEZh9cC0Nc@z>

On 07/24/2018 09:53 PM, Jeremy Cline wrote:
> Adjust tcp_client.py and tcp_server.py to work with Python 3 by using
> the print function, marking string literals as bytes, and using the
> newer exception syntax. This should be functionally equivalent and
> supports Python 3+.
> 
> Signed-off-by: Jeremy Cline <jcline at redhat.com>

Applied to bpf-next, thanks Jeremy!
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
