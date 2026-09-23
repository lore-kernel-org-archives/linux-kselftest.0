Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2931483818
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 10:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159091; cv=pass; b=jh87OzHFbmdT/H9Wbh9Nt3lmsCToxYKCOWz2BcdydbolWWg1vUJgMeobPOlzr2rHoQuqMGkC28xZj8RFn+t8mG6ZgExIgbQqMhltvaLOfca7l0aAm0azzdNCACZzvYXRKBynvye0/KEUGdZk+TkPBkQE7mDx29cHTC5vy5r9MGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159091; c=relaxed/simple;
	bh=YU9M6lNB1ZyLCMAXQr0VzfJfxQQzH5Vll7bn07q18eY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eoNP3YQvz+TtU4AhHn0MCrzIvzaQ/Gi0WzOa/QpPOdNHfPODPJhWKYimyqo9FHAwgOCrCUREwfb4lxtATj8AB+ACnczhtCiSH3GB9dj7ugPe91usDpAtXqqlo+ekKlXg5adjiTu1Eu1meyJ6DdGBZHy0TL3CFzOk5+HK9obyB74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BGKrGhm5; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BGKrGhm5"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53122c5bbb4so8770291cf.2
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 03:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790159073; cv=none;
        d=google.com; s=arc-20260327;
        b=PxRxX/OsJJePDf48IdKUfDmQwWMpclNxTiJVRNQGpqwJUBTYbhwn/ijti+Ob0zX54I
         se4FwmzrpjpXEz4fKvGRhye0vtZERYG06JA1pFYZPJ7cgnfCwDyQi6cdXZads6oevx3Z
         vQKlwoHktrNPXcLuS1OccsSWMv5pnVbom9NgEwNcGzdTWrC1BMNNCkBuHbYP1zN3y61B
         DPHJO6GJLPYaXKOGwVNSyCtVEIbEra5de+07Q8VmgefXvUDJVnOkG4bZgShaLTOYW36I
         UW1gZPJjuvz465MkF3qLma0au+tdRyDPkKoCzYuJDUYh9FYjRCnz4IazozAz+j8VpQQJ
         dgGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3/9GamQb14FQdww9YB29iD9TGuTQWlceV4HeR/O69Gg=;
        fh=rUkNkM7sp5GrtDVHJLDhG5SAxCOQu1zMSPUTirR2JWE=;
        b=aw1iGggi7jb9iKq5lB0lEKarSr88097W/bzYuBj1XUYiAonRX00qkrkEUrLPh64iDE
         bZt7/cHoE42SJUpPv6uozZLuqP2pUVKnZMYD+/frJFEvFGgKpGHIKhcgZedmUC98CB87
         ufy25Z03gUkUlfho7p790SKtbluwTwjFH73QDawH9yIICWfC5MIl09eEoOXWEFNfFT7E
         d8MCTJhVairWqLMOBkU8hE3G15nOPd5d/iDWDErUuGTc/S2osvqWT+sB5xxhA+ojLvUE
         Rlh1p8vU7U6XPALFJFC5coeIyntirvFDo2ICwe+0UX+04m4L3zDwIEyDQcCeiWmYY8BC
         UwtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790159073; x=1790763873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3/9GamQb14FQdww9YB29iD9TGuTQWlceV4HeR/O69Gg=;
        b=BGKrGhm5Eln2f+cvu3+JF2ww7UueTjhQD/lklIcyZkC8FTHn+uPirB4X/hWxhqVmTP
         baUaSszRiASLwa8tb/bA7jMxTwqcoEwcYNLffDa1D7vcOzpjt10s9Itj3TgAvY6SgcjS
         vQYnR5IXHZAkaUjjKIS4bL66N08V7nhyDcnC5CVifFqkBKrHYQ5GrWyFaMBH2EoN7rBM
         C/AQDOliW9YzpSA8PevAoI3tI9TLvRQYfLhfgDBH1p+boVLl4ddE+2ofS/pYOEP9ssVH
         n7zVxjmDMFfbGnjPF1zpMryj6cEKh3DhkDcxoZWwwcEgJuhYXnMwL2byst7BbOskZtSg
         Ay0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159073; x=1790763873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/9GamQb14FQdww9YB29iD9TGuTQWlceV4HeR/O69Gg=;
        b=VrLhA45wrcjCy6rlmly9FIfbr+wvCqD2OxK3Mdzr1h+NNHNdDMmoWHtu0tlP+53c7i
         nmx48uSWMvvwseZqCLZ8Qp3rT+SRmp1NZPUrCw/1HB3vqx+k/x2ACJoM4hVZpwyOnl38
         qzznIrIKCcfmKS+yC4ZxcQ3MP4gH9pzJtrumCHD2E+EstmH/ggs/n89BnpCukFU8IaVD
         tiMJJ/B0kQBLjS15GuSDbZuVLGdhi0Vd2bBjZWrclntAWZ0C3dWtzOhzW+PQ5ZTeUSVt
         oAiOmrajhyJCFXIRB2qK0kWD1vYqRAQNcDDC/1YK4xocNqUmgYR0C3KG4S6Iee2SnzNn
         O3Hg==
X-Forwarded-Encrypted: i=1; AKwUvBxXxBshmj2Vtxqq+WnxNbEj88QlLb8Z1AGyGxGbU+CHWDC8bcBMyaHbUEQCinHdzt9SLPiAwqgpnLVt+tQiFCA=@vger.kernel.org
X-Gm-Message-State: AFuF++mlBIksVazp1N8LMdGPrhpZ0PReMZUrefPztU1GsdoIyz6JycCw
	ow8vGWGma7IRtgwDgQbgvl8sbj7SrIKgXLHeIcW/zOZ8hX/IKsdJXABz96RVfNZ/stn6M30wM7E
	7o18cRypUEifDVEW62e/2abhy/D7hMveShIXq1bFS
X-Gm-Gg: AYBFou03XZkVQiqve2GTy1sKd2+zIEBPXZz9yvEe9aAT++kS1BR4JZ0vk7Gt6DNoCEv
	i0ZLZThdZZSRM4iuR7HxCjGHBZNi6GlGcYF4vsD2ydmBtFoC76Fhunlc/NLH2DsUZGx+ljJ6gxw
	hg04WIO2z1zE2LrEWgze1ctummyM+PzrrVyGzHdWfDGywTfKSxY7gZ/uts4UDrjAtARVRcIeCnu
	PTAGQ28NMU7/1bUMOveJHyytyJgYJnNt/E+52fpvBOLFOk5kemkCqNUqA7CWxyIDnKaZJd4h2tO
	EPEWeOEv5tb9Q7sBEdfZIMm//Hufb0dlqwwRotxW5K4KlsRr0JwsdoFY3VqQ7ocWPvoK18+0PZj
	P4I16sDFaFth1Qys7eWik1I1HqMKRN5XG+DL5DG5XtsT1YOifDLd4pT7CEzXXTzJiakwrUZw54n
	ahTZA=
X-Received: by 2002:a05:622a:4016:b0:52f:c0f4:8 with SMTP id
 d75a77b69052e-532eadccdf0mr33028271cf.40.1790159072657; Wed, 23 Sep 2026
 03:24:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923060547.118748-1-jiayuan.chen@linux.dev>
In-Reply-To: <20260923060547.118748-1-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 23 Sep 2026 12:24:21 +0200
X-Gm-Features: AcwNN1VNbaaMdh7EQrEDuWI6gfonqDQtcuBO60MQ7CxDiug3yN7KPVmA2XQ4Yz0
Message-ID: <CANn89iKHH1s+kXqBXVKmDxmELU0fL-SwU4N8qHRUJjaNECMt_g@mail.gmail.com>
Subject: Re: [PATCH net 1/2] udp: fix auto-selected port colliding with an
 existing SO_REUSEPORT socket
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, Tom Herbert <therbert@google.com>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 8:06=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
> Observed with two independent servers in the same process:
>
>   fd1 =3D socket(AF_INET, SOCK_DGRAM, 0);
>   setsockopt(fd1, SOL_SOCKET, SO_REUSEPORT, ...);
>   bind(fd1, port 0);          /* got 40000 */
>
>   fd2 =3D socket(AF_INET, SOCK_DGRAM, 0);
>   setsockopt(fd2, SOL_SOCKET, SO_REUSEPORT, ...);
>   bind(fd2, port 0);          /* got 40000 as well */
>
> Both sockets end up on the same port and join the same reuseport
> group, so each of them takes part of the other's datagrams. TCP does
> not do this.
>
> udp_lib_lport_inuse() keeps the reuseport rule when it scans for a
> free port: a socket with the same uid and SO_REUSEPORT set is not a
> conflict, so its port is never marked in the bitmap and the scan can
> hand it out again. That rule only makes sense when the user asks for
> a specific port.
>
> TCP fixed the same thing in commit 0643ee4fd1b7 ("inet: Fix get port
> to handle zero port number with soreuseport set"): reuseport is only
> honoured for an explicit port, not during a port scan.
>
> Do the same for UDP. Mark compatible reuseport sockets in the bitmap
> during a scan and only skip them when checking a specific port. Using
> bitmap to tell the two modes apart is not explicit, but
> udp_lib_lport_inuse() already does that for the port match itself.
>
> Note that this still collides when both sockets also have SO_REUSEADDR
> set: udp_lib_lport_inuse() skips such a pair before it reaches the
> reuseport check, so the port is never marked either. That is not a
> common setup and is left as is here.
>
> Fixes: ba418fa357a7 ("soreuseport: UDP/IPv4 implementation")
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
>  net/ipv4/udp.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
> index b3887c42adfd..61cb1e3f5d93 100644
> --- a/net/ipv4/udp.c
> +++ b/net/ipv4/udp.c
> @@ -147,11 +147,10 @@ static int udp_lib_lport_inuse(struct net *net, __u=
16 num,
>                     (!sk2->sk_bound_dev_if || !sk->sk_bound_dev_if ||
>                      sk2->sk_bound_dev_if =3D=3D sk->sk_bound_dev_if) &&
>                     inet_rcv_saddr_equal(sk, sk2, true)) {
> -                       if (sk2->sk_reuseport && sk->sk_reuseport &&
> +                       if (!bitmap && sk2->sk_reuseport && sk->sk_reusep=
ort &&
>                             !rcu_access_pointer(sk->sk_reuseport_cb) &&
>                             uid_eq(uid, sk_uid(sk2))) {
> -                               if (!bitmap)
> -                                       return 0;
> +                               return 0;
>                         } else {
>                                 if (!bitmap)
>                                         return 1;
> --
> 2.43.0
>

The fix is right and matches what TCP does in inet_csk_find_open_port(),
but it only covers one of the three cases where UDP's scan differs from TCP=
's.

On an unpatched kernel, binding 8 sockets to port 0 inside an 8-port
IP_LOCAL_PORT_RANGE:

udp SO_REUSEPORT 7 distinct ports, 9th bind succeeds udp SO_REUSEADDR
7 distinct ports,
9th bind succeeds udp REUSEADDR+REUSEPORT 6 distinct ports, 9th bind succee=
ds

(TCP gets 8 distinct and EADDRINUSE in all three.) Your patch only
fixes the first one;
the SO_REUSEADDR cases bail out of the conflict test before the reuseport c=
heck
so the bitmap is never marked. SO_REUSEADDR on its own is pretty common for=
 UDP,
so I don't think we should leave it.

TCP handles all three because inet_csk_find_open_port() passes relax=3Dfals=
e,
which disables both relaxations.

Please add a comment on top of the loop saying that @bitmap means "scanning=
",
since it is not obvious =E2=80=94 or use !num, which is equivalent here sin=
ce
udp_lib_get_port()
passes snum =3D=3D 0 on the scan path.

Please also extend patch 2 to cover SO_REUSEADDR and SO_REUSEADDR|SO_REUSEP=
ORT;
the helper refactor is already there, just make the bool a flags argument.

Given this is a 13 year old bind() behaviour change and the collision
window is tiny
with the default ephemeral range, net-next seems like the better target.

Perhaps a good candidate for "Cc: stable+noautosel@kernel.org # lets
not break applications..."



diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index bb8cfc62cb00431faefd0371a9de9346b9bb..8628b723ec946eed6337209f62f683b=
a4252
100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -143,21 +143,18 @@ static int udp_lib_lport_inuse(struct net *net, __u16=
 num,
                if (net_eq(sock_net(sk2), net) &&
                    sk2 !=3D sk &&
                    (bitmap || udp_sk(sk2)->udp_port_hash =3D=3D num) &&
-                   (!sk2->sk_reuse || !sk->sk_reuse) &&
+                   (bitmap || !sk2->sk_reuse || !sk->sk_reuse) &&
                    (!sk2->sk_bound_dev_if || !sk->sk_bound_dev_if ||
                     sk2->sk_bound_dev_if =3D=3D sk->sk_bound_dev_if) &&
                    inet_rcv_saddr_equal(sk, sk2, true)) {
-                       if (sk2->sk_reuseport && sk->sk_reuseport &&
-                           !rcu_access_pointer(sk->sk_reuseport_cb) &&
-                           uid_eq(uid, sk_uid(sk2))) {
-                               if (!bitmap)
+                       if (!bitmap) {
+                               if (sk2->sk_reuseport && sk->sk_reuseport &=
&
+                                   !rcu_access_pointer(sk->sk_reuseport_cb=
) &&
+                                   uid_eq(uid, sk_uid(sk2)))
                                        return 0;
-                       } else {
-                               if (!bitmap)
-                                       return 1;
-                               __set_bit(udp_sk(sk2)->udp_port_hash >> log=
,
-                                         bitmap);
+                               return 1;
                        }
+                       __set_bit(udp_sk(sk2)->udp_port_hash >> log, bitmap=
);
                }
        }
        return 0;
