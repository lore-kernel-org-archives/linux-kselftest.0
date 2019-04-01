From: willemdebruijn.kernel at gmail.com (Willem de Bruijn)
Date: Mon, 1 Apr 2019 13:47:09 -0400
Subject: [PATCH bpf-next 0/4] L2 encap support for bpf_skb_adjust_room
In-Reply-To: <1554132731-3095-1-git-send-email-alan.maguire@oracle.com>
References: <1554132731-3095-1-git-send-email-alan.maguire@oracle.com>
Message-ID: <CAF=yD-+KaTO7Ljw2VMeEMzXnGLtFmG3LFvuHgA24_+oOTi3mpQ@mail.gmail.com>

On Mon, Apr 1, 2019 at 11:33 AM Alan Maguire <alan.maguire at oracle.com> wrote:
>
> Extend bpf_skb_adjust_room growth to mark inner MAC header so that
> L2 encapsulation can be used for tc tunnels.

Perhaps superfluously, but I forgot to mention earlier during review:
super useful extension! Thanks for working on this Alan.
