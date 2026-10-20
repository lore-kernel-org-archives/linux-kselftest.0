Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490238;
	b=BOM4vqtIdYX+lczfSMP+Pa7owK+ab/k0v4o4ueiIv85RcZdDCsCzoh9GW7JNIOu9Aj8Q
	 3dmZ/AJo0Y8eqBGrik8hUcCWktiDTRDNYMPNBdPmGyYi/BTQzNFMQr31oJl7SUmzCLGjf
	 6AAdo31dtpS3FRJZzN2HJL9XLpmnDlsTt/8++hqjdB80mm734wXliKO6tfmqgujRn9XyQ
	 ZbxwaCYr0YzTugB7Gyrrdrnd606jbfeuzmpiCtnl2UFLr1K87xCgMEV2333g032qJz89s
	 4GUYE7jeeVMwcznpnFMwRfp8YUhlEuOp9m4ivTjNOhOoiOYLzKzKh+QqOYguY2xT76g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490238;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=pniJDdkIW87m/2LLWCoDDFOWb+/+tlYrdrqp2H3AMh4=;
	b=laTeerutiPJbfa3gR5f2cM0qyAS5dlQNATU1gjfZw8NfkjIExSERAJl9QVroQqhjA3hv
	 KxGUghcwhPPTYKSdVxi2veaGGjQTZ/oFp72NmpfW0uRXNcKMvpnsy9nxTm34hpj/cPqge
	 El1uKGqdhe64zJt4HcdkFKpIA43+mGa7AlJ35+BL+xHvPtSeJ7g90iLBZQxbHkm64YQEG
	 O10dnlqlUHTjhlba+A1CynK+9t+4e2nzbH/Nf7nhN6cVsHikqhypJY68KWJ+2halW8sFU
	 RcjEIC/nG3s3Ozwz+sgk6nCEbwxFvChJR2cWjm5Vq9gWOkvVcbwtFOLDE0j4+03PTdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PqVpqZuR;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583D6606A31B;
	Tue, 20 Oct 2026 09:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 583D6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PqVpqZuR
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CBFC7C62200;
	Tue, 20 Oct 2026 09:58:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A89560393;
	Tue, 20 Oct 2026 09:57:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 50ED910328D8B;
	Tue, 20 Oct 2026 11:57:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792490232; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pniJDdkIW87m/2LLWCoDDFOWb+/+tlYrdrqp2H3AMh4=;
	b=PqVpqZuRQ//I8AY29YsUc2owqoedcL/XuIVNu9Eu6bJcSSiraweQ5xeVGTj4Pd6K0doNMA
	foWMf/Lc4nJxf5bHYvR1lCSx1L2BlzxWHniPhE6Rt5u38psNZ01w9talHYXmd/0uMl5FQ3
	XphW5UVxaz197eVbx5EZABoykUMg1HzXh6QVLBqn1KSzDgkHDJUZugvmPRsx+equ2BnqIh
	rWgMzjs6FjH20vVmnICwNyhxJ3TGyvIB0TLazDOMViYSdExhrZybMOGB0nXR6bi1bhZgl8
	lUOnRTbhfEfCbiUj8k3eatGvAVn9qoBD1YCXjYhHsfDcGYg4Af+0D0UKGkddTA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Maxime Ripard <mripard@kernel.org>,  Alberto Ruiz
 <aruiz@redhat.com>,  Brendan Higgins <brendan.higgins@linux.dev>,  David
 Gow <david@davidgow.net>,  Rae Moar <raemoar63@gmail.com>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  kunit-dev@googlegroups.com
Subject: Re: [PATCH v8 3/8] clk: introduce new helper
 clk_hw_get_children_lcm() to calculate LCM of all child rates
In-Reply-To: <20260327-clk-scaling-v8-3-86cd0aba3c5f@redhat.com> (Brian
	Masney's message of "Fri, 27 Mar 2026 15:31:58 -0400")
References: <20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com>
	<20260327-clk-scaling-v8-3-86cd0aba3c5f@redhat.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 20 Oct 2026 11:57:08 +0200
Message-ID: <8733u0u22z.fsf@bootlin.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Brian,

On 27/03/2026 at 15:31:58 -04, Brian Masney <bmasney@redhat.com> wrote:

> Introduce a new helper that recursively walks through all children and
> their descendants, calculating the lowest common multiple (LCM) of their
> rates. For the requesting child, it uses the requested rate; for other
> enabled children, it uses their current rate. This is useful for
> determining what parent rate can satisfy all children through simple
> integer dividers.
>
> Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
> Link: https://lpc.events/event/19/contributions/2152/
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Thanks a lot for this proposal, it is very interesting.

>  drivers/clk/clk.c            | 54 ++++++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/clk-provider.h |  2 ++
>  2 files changed, 56 insertions(+)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 47093cda9df32223c1120c3710261296027c4cd3..bb602c07df9a2b523a72e1e05=
cc3a27956e7198b 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -14,6 +14,7 @@
>  #include <linux/err.h>
>  #include <linux/hashtable.h>
>  #include <linux/init.h>
> +#include <linux/lcm.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -838,6 +839,59 @@ void clk_hw_set_rate_range(struct clk_hw *hw, unsign=
ed long min_rate,
>  }
>  EXPORT_SYMBOL_GPL(clk_hw_set_rate_range);
>=20=20
> +/**
> + * clk_hw_get_children_lcm - Calculate LCM of all children's rates recur=
sively
> + * @hw: The parent clock hardware
> + * @requesting_hw: The child clock that is requesting a rate change (can=
 be NULL)
> + * @requesting_rate: The target rate for the requesting clock
> + *
> + * This helper recursively walks through all children and their descenda=
nts,
> + * calculating the lowest common multiple (LCM) of their rates. For the
> + * requesting child, it uses the requested rate; for other enabled child=
ren, it
> + * uses their current rate. This is useful for determining what parent r=
ate can
> + * satisfy all children through simple integer dividers.
> + *
> + * Returns: The LCM of all non-zero rates found in the subtree, or 0 if =
no valid rates.
> + */
> +unsigned long clk_hw_get_children_lcm(struct clk_hw *hw, struct clk_hw *=
requesting_hw,
> +				      unsigned long requesting_rate)
> +{
> +	unsigned long lcm_rate =3D 0;
> +	unsigned long child_rate;
> +	struct clk_core *child;
> +
> +	lockdep_assert_held(&prepare_lock);
> +
> +	hlist_for_each_entry(child, &hw->core->children, child_node) {
> +		/* Use requesting rate for the requesting child, current rate for othe=
rs */
> +		if (child->hw =3D=3D requesting_hw) {

This is not working on my end (imx8mp) because the clock requesting the
rate is not identified correctly. Here you use the hw clock, but in the
imx8mp case there are many composite clocks which are made of inner
core clocks (like gate, divider and mux). I believe we should iterate over
core clocks instead, eg:

                if (requesting_hw && child =3D=3D requesting_hw->core) {

> +			child_rate =3D requesting_rate;
> +		} else {
> +			if (!clk_hw_is_enabled(child->hw))
> +				continue;
> +
> +			child_rate =3D clk_hw_get_rate(child->hw);
> +		}

Thanks,
Miqu=C3=A8l
