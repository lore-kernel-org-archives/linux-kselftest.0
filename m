From: daniel@iogearbox.net (Daniel Borkmann)
Date: Fri, 22 Jun 2018 00:33:55 +0200
Subject: [PATCH] selftests: bpf: notification about privilege required to
 run test_kmod.sh testing script
In-Reply-To: <20180621170020.9073-1-ahiliation@gmail.com>
References: <20180621170020.9073-1-ahiliation@gmail.com>
Message-ID: <85088bed-175e-a2ec-fa06-4983f481eb0b@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180621223355.BceEOOrftRBRxRy-jGLPVCd4kX_kZQrlUJTKdI0lIQ8@z>

On 06/21/2018 07:00 PM, Jeffrin Jose T wrote:
> The test_kmod.sh script require root privilege for the successful
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
