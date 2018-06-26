From: daniel@iogearbox.net (Daniel Borkmann)
Date: Tue, 26 Jun 2018 12:22:23 +0200
Subject: [PATCH v2] selftests: bpf: notification about privilege required
 to run test_lwt_seg6local.sh testing script
In-Reply-To: <20180622214032.6527-1-ahiliation@gmail.com>
References: <20180622214032.6527-1-ahiliation@gmail.com>
Message-ID: <b10965e2-1187-2cc1-f51f-20a489a77d2d@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180626102223.V2QrGjyQzWFUX7hGS34rmUNk_IbKvZ1NhmdsDO2weaM@z>

On 06/22/2018 11:40 PM, Jeffrin Jose T wrote:
> This test needs root privilege for it's successful execution.
> 
> This patch is atleast used to notify the user about the privilege
> the script demands for the  smooth execution of the test.
> 
> Signed-off-by: Jeffrin Jose T (Rajagiri SET) <ahiliation at gmail.com>

Applied to bpf, thanks Jeffrin!
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
