Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575471;
	b=gLTJzlxSTZxHwsKzQO5/RSzBwgRWo4E5Iu6zBFS7QzSulnP9TbWdan2FFYpHGBzcrCWu
	 xkcfF6dkNgqc4qCKL64bve3e2mtnIGY+uLPFzf+uLQYoSWtiBqTRtsWkUwq5rrGRuPG6K
	 C+6gdykw+hUMkoI8gzZuFf2YsvX9NQvVwb5d8h0Rc404U3UwHGOLo4OerY/DqjaxshwJ+
	 B3ZurY7kCYul03nvP6bhf9Hk0say+t9iTbsMHXWiMcNS4OiqzcCSYB76ZU5JJksYBDZ5S
	 ZzZZgtbk1yR3pPp/vnJccWo8uvPP/X/VshJ252D5fKba5ZFYSzsgPpIXBYlAmZfqaOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575471;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=PO++a8z3xVSOrsSCzcnJsYBIAhxcpwS/rPUxumQkRLA=;
	b=zFbAi+mTKquVkeEH9gNrKnDjTMXCeU4A209WTO/+W4g1fvC47eWooPN0n+9t+Tsfaza4
	 xq/+IR6nyc5GCvL6xi7UfgR/3tlv+/7WmNKEglJVEy7og1hieP9VmrARuIWAQ6X29xwnc
	 S2aFS0Ise8cuqnDwDkA3J/7prTxlMcfjg9sC15cb520ie3B5S4DxrIZsd1Yf1odTKRO3j
	 P2Rk8mUyPwDQvtsth6Qn/Qv4v9b5RhhiwHXCBILq4LX8Ijr2xv4VAsMPMwJXsoX0+eKxW
	 OnWTF3EgebRxDJUTi+9q6Ih6qukqXug1+n54QSKXnDfcw+8+uCNC3XqA+VCD1hahlZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CGBoqbwp;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A59606A321;
	Wed, 21 Oct 2026 09:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01A59606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CGBoqbwp
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 17F8EC5CD74;
	Wed, 21 Oct 2026 09:38:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D741606E3;
	Wed, 21 Oct 2026 09:37:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35856103289A8;
	Wed, 21 Oct 2026 11:37:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792575466; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PO++a8z3xVSOrsSCzcnJsYBIAhxcpwS/rPUxumQkRLA=;
	b=CGBoqbwpj9xTkVn6WWXitamQrNNLf19slUfZI+4ruQfN9t8GL0sXg2fjd33/7/B/r/nLx+
	N0hPE5qWOIoKnNnB1H5M6PQkd5KlM50V8HHwmo5bUv+6MMnib5DVJtVkPZn2tLCsLgE5+P
	x7H9zgf5loFIPZfCEYJwx978WollkDP2OLlX39sLtG6aM6+IyT4wZPtQRHozYz9BOb40u2
	siBiQJtBpzaJiyky/qAXNiAHvGquswO4Qd0V96veXxMaWU656/vhNOmNjF/+AIjIHJbIkT
	mFWCzR+DuU3ZXnvja4CayAQ4MzwH3LIYpaD1blGXGJ0R8A+mu6103BOYzVH0wg==
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
In-Reply-To: <8733u0u22z.fsf@bootlin.com> (Miquel Raynal's message of "Tue, 20
	Oct 2026 11:57:08 +0200")
References: <20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com>
	<20260327-clk-scaling-v8-3-86cd0aba3c5f@redhat.com>
	<8733u0u22z.fsf@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 21 Oct 2026 11:37:42 +0200
Message-ID: <874iefs8bd.fsf@bootlin.com>
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

On 20/10/2026 at 11:57:08 +02, Miquel Raynal <miquel.raynal@bootlin.com> wr=
ote:

> Hi Brian,
>
> On 27/03/2026 at 15:31:58 -04, Brian Masney <bmasney@redhat.com> wrote:
>
>> Introduce a new helper that recursively walks through all children and
>> their descendants, calculating the lowest common multiple (LCM) of their
>> rates. For the requesting child, it uses the requested rate; for other
>> enabled children, it uses their current rate. This is useful for
>> determining what parent rate can satisfy all children through simple
>> integer dividers.
>>
>> Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
>> Link: https://lpc.events/event/19/contributions/2152/
>> Signed-off-by: Brian Masney <bmasney@redhat.com>
>> ---
>
> Thanks a lot for this proposal, it is very interesting.
>
>>  drivers/clk/clk.c            | 54 +++++++++++++++++++++++++++++++++++++=
+++++++
>>  include/linux/clk-provider.h |  2 ++
>>  2 files changed, 56 insertions(+)
>>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index 47093cda9df32223c1120c3710261296027c4cd3..bb602c07df9a2b523a72e1e0=
5cc3a27956e7198b 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -14,6 +14,7 @@
>>  #include <linux/err.h>
>>  #include <linux/hashtable.h>
>>  #include <linux/init.h>
>> +#include <linux/lcm.h>
>>  #include <linux/list.h>
>>  #include <linux/module.h>
>>  #include <linux/mutex.h>
>> @@ -838,6 +839,59 @@ void clk_hw_set_rate_range(struct clk_hw *hw, unsig=
ned long min_rate,
>>  }
>>  EXPORT_SYMBOL_GPL(clk_hw_set_rate_range);
>>=20=20
>> +/**
>> + * clk_hw_get_children_lcm - Calculate LCM of all children's rates recu=
rsively
>> + * @hw: The parent clock hardware
>> + * @requesting_hw: The child clock that is requesting a rate change (ca=
n be NULL)
>> + * @requesting_rate: The target rate for the requesting clock
>> + *
>> + * This helper recursively walks through all children and their descend=
ants,
>> + * calculating the lowest common multiple (LCM) of their rates. For the
>> + * requesting child, it uses the requested rate; for other enabled chil=
dren, it
>> + * uses their current rate. This is useful for determining what parent =
rate can
>> + * satisfy all children through simple integer dividers.
>> + *
>> + * Returns: The LCM of all non-zero rates found in the subtree, or 0 if=
 no valid rates.
>> + */
>> +unsigned long clk_hw_get_children_lcm(struct clk_hw *hw, struct clk_hw =
*requesting_hw,
>> +				      unsigned long requesting_rate)
>> +{
>> +	unsigned long lcm_rate =3D 0;
>> +	unsigned long child_rate;
>> +	struct clk_core *child;
>> +
>> +	lockdep_assert_held(&prepare_lock);
>> +
>> +	hlist_for_each_entry(child, &hw->core->children, child_node) {
>> +		/* Use requesting rate for the requesting child, current rate for oth=
ers */
>> +		if (child->hw =3D=3D requesting_hw) {
>
> This is not working on my end (imx8mp) because the clock requesting the
> rate is not identified correctly. Here you use the hw clock, but in the
> imx8mp case there are many composite clocks which are made of inner
> core clocks (like gate, divider and mux). I believe we should iterate
> over

I meant "made of inner hw clocks" here. Just to be more clear, if my
understanting is correct:
- requesting_hw is the hw clock associated to the composite clock
- child->hw is one of the inner composite clocks
So the comparaison cannot work. Iterating over the core clock therefore
solves this incompatibility.

However, while trying to understand better the values of the pointers
there, I realized the initialization of the various inner hw->core
pointers are made all over the place (?) and in certain cases, they are
even not done at all. For instance, a composite clock with a single
parent would not go through __clk_hw_set_clk(), at least not during
registration. Either this never happened before, or maybe some
recalc_rate() spuriously set it by chance (because __clk_hw_set_clk()
calls are made a bit everywhere), or maybe because this problem was not
really a problem without the v2 rate parenting Brian is proposing.

Anyway, I think this situation can be fixed easily, so I will propose
something on top of this series.

Thanks,
Miqu=C3=A8l
