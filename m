From: willemdebruijn.kernel@gmail.com (Willem de Bruijn)
Date: Wed, 9 Jan 2019 08:24:12 -0500
Subject: [PATCH net] selftests/txtimestamp: Fix an equals vs assign bug
In-Reply-To: <20190109105007.GA14518@kadam>
References: <20190109105007.GA14518@kadam>
Message-ID:
 <CAF=yD-KSFzCo1PjpcG=822WxVBNMmYZkNKaACC9Z8kysPbQuFw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190109132412.dL3n_Rl_nCKxmQ4LZUIpIE5o8GmJKjkOrLfGSLOObLk@z>

On Wed, Jan 9, 2019@5:52 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This should be == instead of =.
>
> Fixes: b52354aa068e ("selftests: expand txtimestamp with ipv6 dgram + raw and pf_packet")
> Signed-off-by: Dan Carpenter <dan.carpenter at oracle.com>

Acked-by: Willem de Bruijn <willemb at google.com>

Thanks for the fix, Dan.
