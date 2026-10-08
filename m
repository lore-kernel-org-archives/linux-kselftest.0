Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190F8388E49
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 21:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791496092; cv=pass; b=sA7zWI6DFj6leoz+RqYyYjUvkb65GL/AyCRw06sOj1hbOOKuYsWEAjdMnDitlE1WOkgjPhNIhpWVpcp5u76Hj0xE14tesF+clgZyBQhDnuH1k9/M+q8p0Q5Ml1RlwXY0KN8xheDCfw12X5QlImcQwDg1eGpM2Vb+lE1vmuFeNBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791496092; c=relaxed/simple;
	bh=d/cxQi5bl2KO3QA7Ge7jeOTx9NRmHL08KKAX7/aHZBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T3L8YnbEqvfPha7S0cyVW/9om0Xj6kd5l9b5r6AOwVNWfE7qY6qTngpMuJewE1+3/uSE3PTMTO1WvOoa+w5p5nD0jP9AB37NB09Br1YcSjRCNmaBOINIPX9N6yZHQ74j15pQmnopvbVHsmi9roy40Ngis2ToA8sSPH8VFxvpHiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i4XOrfKH; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i4XOrfKH"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5337c7b9937so111461cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 14:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791496090; cv=none;
        d=google.com; s=arc-20260327;
        b=A3n/Zcbul5GeYg3JGeoccIckEotJ0QkV4Ok5Q5IgadPcm9/7SoUFuhfT9JWFfSuV4U
         YCa+wXc8AP49U/KR8+pnoImy1u16lEJCBLKUjYNJTYltNmpn2xCjKn/svpK0k74lw7VV
         u1a6jWP/evBu3O8pw8COC4dx30snsKERKFitZF9Zn32bFxnqxMoz0M9rW5eKJUOzz7W5
         IXjOhA9dN43NSIts+nZch06UkxwDkeOqTSjll3ZXWWOCX3iPJIJ48B91gumwTGQPEWIL
         OqoHbnk30AzQHtl0TmCfgi9adIPFPXrD1ci3Fqv9vDwQ5XKUlGi4Fb5/L8Xr/Jn4Ruqq
         rwzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d/cxQi5bl2KO3QA7Ge7jeOTx9NRmHL08KKAX7/aHZBM=;
        fh=/W/26JllHZ35+qcXzBZ4ATlQXXSnFfF9tumehtq0QWo=;
        b=B+bJ3VIRCOKn5lTZwDPQ4ayphXKrBPl7PmP2+IW04yinQCPjW58y6xAEsQ3l0IjKMb
         T1dz3J7tYV3lJ7Fhfh8RWh65W19ulF18TXTK7G+awJuqq5LwY46vMWiTrsDxRTauhqD9
         8A3PZ5OxUijdKl2BOXkK5jfUdotjOH2agpWUm1f7jUf5Vc1SXp+cJmufzOnlHNlf5obx
         GOZGCeG3uqiqADhd7zyyMr4g+I1tUJuz/7C2cx5s6F9bPEiOPA+Jaxy1xKDq/t5tH02M
         tq0ho3yID5K3SBqgL8mbTG+7YglGKHsRtXHmmMbYCDqKa8m91ChUXdKNMPps8HZ76M9k
         1aiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791496090; x=1792100890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d/cxQi5bl2KO3QA7Ge7jeOTx9NRmHL08KKAX7/aHZBM=;
        b=i4XOrfKH4Z7wonh8hJEW2LlWuFXiwMClZcHlU+QZ+Ln/cvdTrcyrUybMAY43wcUmJF
         W0hxPjxHnNSlpqLJTyjIBNJnd2eDSgbVmJxgxfZ1LQakFV6wx84N7GHh3dkXEW4bSfgp
         4x4aaWZQHvZg95WZsyWNIs3jo4gk87htFQYARWHzT4GagqbaU0mT+Boct6mCoQjxpO2O
         nZZAZPLg7fcUoCk1JatmzCekIszCYakd6a9wA+zJNNOIy/NpSt0PFAawsXOrmlTMfZvC
         Lgs+JPzpvKhUvjnGTqiLFR7h/N33LazRvRK8vAinLdNh6Is/IQc6ncHfIhfr8aSxVXlZ
         aJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791496090; x=1792100890;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d/cxQi5bl2KO3QA7Ge7jeOTx9NRmHL08KKAX7/aHZBM=;
        b=uGwluolZBmfponeZD8MROiYgmsQIt/t/Yj0thfsW5+b1SskgiAzuVUNAzgKASNefQd
         d+mknsofbdICt18i0UpbzhpZJ+ElfmFkAC2CmDzoLHX8zL9fPWs8+cGBhFQDtg9lQDoF
         QaOOnoUEi1HBnlWRGC/NIiANzB1hHWL1BCnUUEr8/gy9TFKJH8ay818Zmr0370UC1gvF
         Vvy4jGG+sykC3QFO7SdYZg41v77brlhdqHkOSWT4CtY34uTB/WM9jJENoBj48zMfsHDo
         hcuJaFwoQydAA4h9jUPR098syMzuHR0h3YYdhEA1ItQXSgODPC82x2Gm/AuX/abTKQOv
         a7Rg==
X-Forwarded-Encrypted: i=1; AKwUvBwZfXbuhOhis0sDQhUkzBLdD4pUg1rL2u1kP4zSeefGhEfJWU1gf/ClMUJuyykH/ftRBjD9+b/oTgQG6lNzQ3E=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8UqrSPlmdTdl4gqvtOktdXfZKhhW/pqvg4xuUNWtmsb1MUNRy
	QXQCsvr5WsBOC3soLszaN4obUObtKDBNSsfvIJFuI/GWUITPCEN+i0cVlJOBRnae4IFWbzN+OLF
	Oo23lhP7rKzDJCd4w0euuq0VLkUHFwHMzirV/hU0q
X-Gm-Gg: AYBFou0tbcuPgDYuQHPthTLVvKNQHYWynLSSbUT4toXrHcZ+v0NznW3TKHYCwU+LCAx
	FAw5vSMAaqnhUPvdjWdNBL8OwdqDOio41+2gpL8duIuUPyA/CnyyRCe6xcZNcfXsrY6t+N7dKBN
	7Q+6orqGfxvsVhcgi5OiDPlluB4e50272vdvzjjWtPhNL0+Wn54e9GLiL6suN1Gh15IHhKpMkZb
	BiTPbSDItXZxN4wsjHXYAd5VC/Wx9R0HnQNBRYHEw8nafFNz80LyiuCtJBhobkA5p0dIPdNkfkt
	t0r9vGKi46nJnUYPYZb8fWKg363rkwhMj2D4GGOUZ1eg+6DJdDLe6px8/AC4yrwBqI/DxZGE72X
	tajMaNN/R29MgnoF25DUnJCIghM/3TZyRleK4N1wvtN9m
X-Received: by 2002:a05:622a:5793:b0:532:9220:a9ae with SMTP id
 d75a77b69052e-5359e455c40mr1433461cf.6.1791496089446; Thu, 08 Oct 2026
 14:48:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAL4WiipKWgA-EcFWDQd3t7nBwU7AnkLvqs6j--he-dR-SAgqiw@mail.gmail.com>
 <20261006141300.1722466-1-ncardwell.sw@gmail.com> <20261008212007.11619-1-nramaswamy@openai.com>
In-Reply-To: <20261008212007.11619-1-nramaswamy@openai.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Thu, 8 Oct 2026 17:47:52 -0400
X-Gm-Features: AclHuK9JwqNAnKKUmQkb5nbkkVlAY3vgd5ysmdQybG9TDCTGPUW7dr1Q1zAJXag
Message-ID: <CADVnQy=X6-=dBQ5xjt5r5cEnjvEWjYPxg+vn3nH481r4kFc96g@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] tcp: restore RACK list membership when undoing loss
To: nramaswamy@openai.com
Cc: Neal Cardwell <ncardwell.sw@gmail.com>, edumazet@kernel.org, davem@davemloft.net, 
	horms@kernel.org, jiayuan.chen@linux.dev, kuba@kernel.org, kuniyu@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, shuah@kernel.org, 
	ycheng@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 5:20=E2=80=AFPM <nramaswamy@openai.com> wrote:
>
> From: Neil Ramaswamy <nramaswamy@openai.com>
>
> Hi Neal and Eric,
>
> Thanks for the detailed replies. Neal's approach is much cheaper than my
> original patch on a few UML microbenchmarks that I ran.
>
> I'm not entirely sure I understand Eric's usage of "often" when he mentio=
ned
> the O(1) list splice, but the metrics that I've collected from my particu=
lar
> repro seem to suggest that Neal and Yuchung's assumption about LOST but n=
ot
> EVER_RETRANS segments holds in the cases I captured, so I'd be happy with=
 that
> approach.

Great! Thanks for checking those.

> (One super nit on the runtime complexity of it: in the comment for
> tcp_tsorted_relink_skb we say that it's O(1) amortized time, but I think =
it's
> more that during partial undo all relink calls together traverse the RACK=
 list
> at most once.)

Sure, OK. :-)

> For Neal's fix, I also did write up a small packetdrill that shows that s=
egments
> that are already retransmitted and then marked LOST are not added back to=
 the
> RACK list during partial undo, as intended. Happy to contribute that if u=
seful
> for explicitly documenting that this is behavior we are okay with.

Sounds great. Please include that new test as another follow-on patch.
I agree that test would be useful to document this behavior and ensure
the expected things happen (and no bad things happen) in that case.

> How would you like to move forward here? Do you want me to fold this into=
 a v3
> patch with attribution tags or do you want to send a new patch yourself?

Please feel free to send out a v3 patch with attribution tags.

Thanks!
neal
