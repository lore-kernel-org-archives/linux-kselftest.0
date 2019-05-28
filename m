From: peterx@redhat.com (Peter Xu)
Date: Tue, 28 May 2019 10:17:16 +0800
Subject: [PATCH] userfaultfd: selftest: fix compiler warning
In-Reply-To: <20190527151859.GA3217@ip-172-31-44-144.us-west-2.compute.internal>
References: <20190527151859.GA3217@ip-172-31-44-144.us-west-2.compute.internal>
Message-ID: <20190528021716.GC22519@xz-x1>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190528021716.MLPgYPcQpzZ6h_ybobUckFkb1MN3fOekZktuaazDvlM@z>

On Mon, May 27, 2019@03:18:59PM +0000, Alakesh Haloi wrote:
> Fixes following compiler warning
> 
> userfaultfd.c: In function ‘usage’:
> userfaultfd.c:126:2: warning: format not a string literal and no format
> 	arguments [-Wformat-security]
>   fprintf(stderr, examples);
> 
> Signed-off-by: Alakesh Haloi <alakesh.haloi at gmail.com>

Reviewed-by: Peter Xu <peterx at redhat.com>

-- 
Peter Xu
