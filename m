From: davem at davemloft.net (David Miller)
Date: Mon, 01 Oct 2018 23:19:14 -0700 (PDT)
Subject: [PATCH net-next] selftests/tls: Fix recv(MSG_PEEK) & splice()
 test cases
In-Reply-To: <20180928161808.10363-1-vakul.garg@nxp.com>
References: <20180928161808.10363-1-vakul.garg@nxp.com>
Message-ID: <20181001.231914.2200760830649337187.davem@davemloft.net>

From: Vakul Garg <vakul.garg at nxp.com>
Date: Fri, 28 Sep 2018 21:48:08 +0530

> TLS test cases splice_from_pipe, send_and_splice &
> recv_peek_multiple_records expect to receive a given nummber of bytes
> and then compare them against the number of bytes which were sent.
> Therefore, system call recv() must not return before receiving the
> requested number of bytes, otherwise the subsequent memcmp() fails.
> This patch passes MSG_WAITALL flag to recv() so that it does not return
> prematurely before requested number of bytes are copied to receive
> buffer.
> 
> Signed-off-by: Vakul Garg <vakul.garg at nxp.com>

Applied.
