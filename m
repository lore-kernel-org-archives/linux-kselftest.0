From: alexei.starovoitov@gmail.com (Alexei Starovoitov)
Date: Thu, 6 Sep 2018 11:00:20 -0700
Subject: [PATCH bpf] selftests/bpf/test_progs: do not check errno == 0
In-Reply-To: <1535994119-4853-1-git-send-email-mauricio.vasquez@polito.it>
References: <1535994119-4853-1-git-send-email-mauricio.vasquez@polito.it>
Message-ID: <20180906180019.a3u4tw322qhfkj3v@ast-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180906180020.iMrvHO4g4pmBGt_uLbk9Rl__Dwbku4QAn4TAgu0n5IE@z>

On Mon, Sep 03, 2018@07:01:59PM +0200, Mauricio Vasquez B wrote:
> The errno man page states: "The value in errno is significant only when
> the return value of the call indicated an error..." then it is not correct
> to check it, it could be different than zero even if the function
> succeeded.
> 
> It causes some false positives if errno is set by a previous function.
> 
> Signed-off-by: Mauricio Vasquez B <mauricio.vasquez at polito.it>

Applied, Thanks
