Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793657334;
	b=oSX9bUekDzHtFMfh8DwqgY8ZQO510NeOlsSAkAWR6PaYsMDQfhlq3dfE88NZkbRCj5f/
	 +vQDguozbC2Lhv19ZcOtqPtVtcHi/tr3VyNRTLv6qoXvbhDh8iistqXe6ZloQIK3OZ9fp
	 cTpMODtFRxp2Gi29o2KS5n8TLmQd1brB2iDKIyzd/lYZAjZ1vZYGD8bGEZhXbzlB/Ra7k
	 nf7chAFykjEoA/hjQVqDaQlz6Rl+Fz8rqUfmfQQXhX3RXiBDqVOHQw41pnDwEDprKehDs
	 c2TaQF5Rhxb0doDV6RuQx+lGv3iwYJcs9LRethT+dt1sgW5T5jfTlgt8uhELKNQC1Qw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=04iaPr/Q4xOZpTpewylydaBAPbXSsxNLl37nHemVSI4=;
	b=EaaqyfiXyIVn/loVAv1nwwOUfG06leRH59I86oWP9U4zUgL33CIKfAKdtWx00LX8ZYb4
	 OTtX+qwpu57axub/JuZsVvs91NOQJuOwWMKt9Gi6VtcElxxBkxTgFqImqqldcs2DJevVT
	 E8dsaz1yWCWg3XfmZ/1Wf2OENHw2vBF7xK20D4sVY6uLUkkD3lW6BflWvP7RC33k4uwHR
	 rUIiwZzY6T9cxPkAR4TWS4X1cjHFQe/gP7kfpIJbYgbpU/RXHG5+HGdcp5c8lvErErMIU
	 RWu1V9VCUvdhHMrqoVXvFa8Pz8K1vd+HSY8zeEWMDXhMqumwR8As6MiwQ2CsURDp2Fw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NQVmmG6P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F853606A339
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 22:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F853606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NQVmmG6P
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so3163a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 14:08:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793657332; cv=none;
        d=google.com; s=arc-20260327;
        b=VFwlD8p6m9Uyg8pIUX1OfvP4p8GkNhQ5EMa3t2FBJq/Kejdb00TZz4dgnEnT9C1n0M
         gULGESC1sIVI/IuofB+gcm2I+T1dfDsIQjYV/OLY+Zc9jVQRkzIMbaI+GrT9DUN0ltQh
         dIPhIPh/1kF+3rRURzraC9VqcOKQfwkkNjwl5M9JwjWgXBg0Y5oIKVwqO7p6/sCITv1a
         3uRGUYUcsUi7jivjD1JAkLrsKVNGK4f0qxgpm+ZW76Te2nS7mXqNpjdZJTPsWrQgxEve
         XZO4G3KA78BZaJZ1+8qUWI4DXn2Y/cAIsKUfMnwiik0ZkcyzRT61va6+fZWI0G5L12TC
         qWHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=04iaPr/Q4xOZpTpewylydaBAPbXSsxNLl37nHemVSI4=;
        fh=Qv8ZzCmVTbJ8Powt7A4n2hXounfEhZlMbnkMU6EHbiA=;
        b=JcflyPdDNwvH6iPy1ScJihKLD1P8XNeFs/rHnScTpvbg33O51TB6lhm2UtVWHn8mST
         xuWqCyRDL0A9EFIlGeq61bSaeAl/wVCSsVUnbIi9TN4Rhmuga/lQ+glCcQYJ3V7d1Su0
         /DpFXsKoHSn3bow9hL3lWVypx8/XQj4UfvQP4xvRZ/vRquj4Vmb/sg6bT+0JX1Ay0gDn
         Aasbsm/K4eFHpMKQMOpzj8PQRSVvFRdAkQ1LVYRksvrd2IERmOCHUBNUfhVXgb65QxuB
         ldmJMxhiv4fKLMXoN64TRBYnVD0IVeDl/nkgTadwnXARisBGvPp9+YtoB9AKNsRXHzep
         I/tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793657332; x=1794262132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=04iaPr/Q4xOZpTpewylydaBAPbXSsxNLl37nHemVSI4=;
        b=NQVmmG6PVNjIV2neyCA9M2St1Rsk5SaTQnqw5Z6BjHpTxwxLNWVY8mIkPbVqVv43Ez
         g1kwACtxFVkWQNTvKZae+D3NXZb1mGV/FYrWMJmL1ujN5VbI0phU2UUIvZ1RySl3e3Zo
         pSWAqChgMM4wStuo1gtjzteMY/kaOtiT6M570xyqph8/dEsROs5zKnwpOJAET9qepMSV
         vCdB69pn/VvgSV+86EtlwKhYvkM3M3xgeJW6A9qGry6TY6rHG0YTPrb0+QZyIpwScHCC
         ZGyoBcYE1XaKnaLT2NSoMPElQaaW3yDHAgebA3x6qLhgrJbVVPEyWmoctHmuVm5Jwrjd
         9rQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657332; x=1794262132;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=04iaPr/Q4xOZpTpewylydaBAPbXSsxNLl37nHemVSI4=;
        b=zm6QlrZM9d0I8gL07rb/I3EZz4mpTMSIbZrAF1OciQinLiI6puQgGvbpOnyhyi1aOm
         8ofiouDhaiYawRz/J6gRch+/iX2YaLBlvCeL/40HbOIKBrlgM5RcCIKcgvG89CXZioal
         wWWayzFcxwodEgJH+OG4zSMY0RDAcFGO8Ayi5kgM70oZxx6UxVjLmJJVdrzM4s72vtbV
         ds79XpFlniNTUEO7X+PXELcXw8henrumlcfpS4jOEYLs6n0XCVohq/WCTGv5yqUSN68F
         1i622wdQShOg02eHMjVzj6YkTbRT0it58osIY1NRpp+24nXNt8xbwTObGq8NaPmXE8IG
         F6ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIxJAk0S7Cn+ZYbEPAnzo1QCYqFKe0BVBDn+Ab9+RaSWjslbTlv5PbJbnQcJzq/8FhtcjWSWu1Q8PUXfFGHT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9w5AlNmc/cRkx9gD+rtQUqBvlsIAOjKAlVgTh09rFZL+ie1rfM
	8WvpxKqEbU1QxggOEzeIB93NDji5a4StKoOJ9C+tuTc0ACEwxm29EmheS7P8bw6lajLlTlOI4Es
	8sj0Gr/coZjdV1LZvr3jjTkKHaVSnAkhuiDM8TuYs
X-Gm-Gg: AYBFou38R8UOBj3LvcDs1gLMqfQJH94Qljb6KkJpzdI1MJBfc9urnH8JuBVWuo0RiXE
	PGhavQ26lTjqVlmULow4PoP4AH6liO52FJA/0Bb2+C1vssW1XYh2mgzgnzLfcwRU1nwtEg/5RhH
	s8iUbG9Fb54NN5RtZQjwmrshtKLD+lgFIJmyPFLEpDPGsArnSmvbLUsDhO6Yrf1wV5BhyuMvqS5
	q4DCgO2vxDkB8XwFDbYagNn592Ipz7pssEG9P7HUjk3Z+AUp6Num3jNHUhKqvZI2kh0uOCuXHx6
	fm+vHI3ojQhhJqCMmqi+2KvJJpw3/a6wbgIkqRTKFDoAZirOwmDvJ4u2tUjCaVPTwA4inyAHxhA
	fbgT3+0rMypF7D+O+yGenmLhSN3u4Hg3B9B+hF8Q1Qy+zj9oxmj5QIH8/Rt5oa2fXkmU=
X-Received: by 2002:a05:6402:438d:b0:6b3:f12d:7405 with SMTP id
 4fb4d7f45d1cf-6b53e778d41mr6126a12.14.1793657332128; Mon, 02 Nov 2026
 14:08:52 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030083539.777877-2-almasrymina@google.com>
 <179357408146.3131.2882435952119280563@kernel.org> <CAHS8izMt+5HBjkOOsb-FrwKoXxEBuDn=gf5p+64akYS=SAoQrQ@mail.gmail.com>
 <9afff44d-f8eb-4549-8aae-f99a53339319@redhat.com> <20261102185856.1824792-1-almasrymina@google.com>
 <f4f0fbd6-63e4-42d3-87bf-9f888a8de1a8@redhat.com>
In-Reply-To: <f4f0fbd6-63e4-42d3-87bf-9f888a8de1a8@redhat.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 14:08:40 -0800
X-Gm-Features: AclHuK_l2m6u_KEy2pbXoZVvzOwIMj8tI1lJiwLeWg-R9MKJCqxW8rPbMreP4XU
Message-ID: <CAHS8izNQjF6nzPym-kXO2Nr6jv5oKsnFGCNYWZH_zBTGoT98ew@mail.gmail.com>
Subject: Re: [PATCH net v5 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, sdf@fomichev.me, 
	kaiyuanz@google.com, kuba@kernel.org, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, dw@davidwei.uk, ap420073@gmail.com, 
	davem@davemloft.net, edumazet@kernel.org, horms@kernel.org, shuah@kernel.org, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org, 
	andrew+netdev@lunn.ch, sdf.kernel@gmail.com, hawk@kernel.org, 
	ilias.apalodimas@linaro.org, daniel@iogearbox.net, razor@blackwall.org, 
	tariqt@nvidia.com, kaifengw@google.com, dtatulea@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 2:01=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 11/2/26 19:58, Mina Almasry wrote:
> > On Mon, Nov 2, 2026 at 7:29 AM Paolo Abeni <pabeni@redhat.com> wrote:
> >> On 11/2/26 00:16, Mina Almasry wrote:
> >>> On Sun, Nov 1, 2026 at 3:01 PM <netdev-bot+sashiko@kernel.org> wrote:
> >>>>
> >>>> - [High] The dma_dev use-after-free this patch says it fixes can sti=
ll
> >>>>     happen for RX bindings made on a virtual device that leases queu=
es,...
> >>>>
> >>>
> >>> I know about the issues with leased devices. That needs a bit of a
> >>> rework, which I have done locally, and would like to send out as a
> >>> follow up fix.
> >> Will such follow-up rework the code touched by  current patch/series?
> >> how much? I'm under the impression that at least the fix for the issue
> >> reported here would be quite overlapping.
> >>
> >> /P
> >
> > I pushed the follow-up branch on top of v5 here so you can see the exac=
t diff:
> > https://github.com/mina/linux/compare/devmem-teardown-v4...devmem-lease=
-bind-map-dev
> > (commits: https://github.com/mina/linux/commits/devmem-lease-bind-map-d=
ev)
> >
> > There is some overlap (~55 lines of v5 touched across a 6-patch +262/-9=
9
> > follow-up): it renames binding->dev/vdev to binding->map_dev/bind_dev, =
passes
> > the net_device explicitly to net_devmem_lock_dev(), factors out
> > net_devmem_close_rxqs(), and replaces the !rxq->lease / !netif_is_queue=
_leasee()
> > skips in net_devmem_dev_unregister() and mp_dmabuf_devmem_uninstall().
> >
> > I kept it separate only to keep this net fix smaller and easier to revi=
ew,
> > since the lease issue is pre-existing. Happy to either land v5 first an=
d send
> > those 6 patches right after, or fold them into a v6 if you prefer avoid=
ing the
> > churn.
> I hoped for something smaller :)
>
> I definitely would not fold the 2 series.
>
> I'm wondering if this could be considered net-next material? pointing to
> net-next will offer better guarantees for all the work to land in the sam=
e
> release (no need to repost in such a case, I can apply this one to net-ne=
xt
> directly).
>

I'm more than happy with net-next. Honestly so many AI-foudn fixes
requiring so many refactors that net-next makes sense most of the time
now, for me at least. Thank you Paolo!

--=20
Thanks,
Mina
