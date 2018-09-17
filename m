From: davem@davemloft.net (David Miller)
Date: Mon, 17 Sep 2018 08:15:31 -0700 (PDT)
Subject: [PATCH net-next] selftests/tls: Add MSG_WAITALL in recv() syscall
In-Reply-To: <20180916043428.24329-1-vakul.garg@nxp.com>
References: <20180916043428.24329-1-vakul.garg@nxp.com>
Message-ID: <20180917.081531.1710106422276499589.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180917151531.cXUP8DWtCjtTpi8gaB873VsInmylu1wMQyP8ASiJlvY@z>

From: Vakul Garg <vakul.garg@nxp.com>
Date: Sun, 16 Sep 2018 10:04:28 +0530

> A number of tls selftests rely upon recv() to return an exact number of
> data bytes. When tls record crypto is done using an async accelerator,
> it is possible that recv() returns lesser than expected number bytes.
> This leads to failure of many test cases. To fix it, MSG_WAITALL has
> been used in flags passed to recv() syscall.
> 
> Signed-off-by: Vakul Garg <vakul.garg at nxp.com>

Applied.
