Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCAF29AAEA
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 15:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769007838; cv=pass; b=c0knQRCCpv2jP1zL0BdvMT8pxY05WsNBqMr8POKSwf5bxMpxRu3W6nDOy3YzN/1bQKjKEQT+WiUAs4LiL6L8n2O6x/b/v6V9rFDVF08eeR5SEE/onC5P0whE5QEf8OEbGovtewNn33jG3UQpXIDueCdhqsCjWKSaMM6Vv6jyhk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769007838; c=relaxed/simple;
	bh=QnaNpo6lSG0kfxJQjSpSQ0lKtOo9FhwWS7NgxulV+90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTcuSB93xiOP4xlJdebVIlz8JxQojty0OknHDuTIlot1T7Tk6RaK0WOvbJAG3OMizc4upkagTq/ohDgBzNKdugsX7LdPWAgspTSvshBf+NHGrC1ffRXMJHl+2LmSWqasuQPy+2hOq0OP1C+I3Lfr9m0FHGt9DUPj7S7cf9glQVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GbCPjr8u; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GbCPjr8u"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-501506f448bso39396311cf.3
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 07:03:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769007835; cv=none;
        d=google.com; s=arc-20240605;
        b=FlvovHV7jr7YmDuqQQnZPdrWTjfqFdw36yu/HokrhwZDbMJwHx8XfqfcbbEnufHpZG
         3jrdZLEKTqTX5Ju+XMWSQSaIM8UdmJZCj6SKDBH4RksgpUlJeOZExlNAwzvvcREX8mv/
         qEUQQhL63oxD7Jbntya2TuKePPaNUn8H+dfygvbrdjmnpYzmwskPntY1sN8YIJVOEOWw
         zWesAANixqFQUiSEJJubNvmeneFW1wwCvX7un+Np5KeM3T/g+mU3Ju3r8qOTMyPk3cvu
         eKDHvooirr91UJhdwK25rkOryNkf4fF8SuUpA3tseDg4jK1OrpqJYKlo/QJQD823M5gO
         5gcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BkfXslef5CleGTOMTYe++OlaJ9VsT1NdIrx0Bt2jP6E=;
        fh=qGCb4CAgSYQLMDK9XparxGGQFX5aVP6oynVyOzh+uQs=;
        b=MwdUZF3XX+xw5zSsJWeVB3+LCqIEQ8glE1fucAdtF60XjrhnFIaTs54/dHvmal/yWS
         p+unYjCjn24X0p8RSAirf0uMEgRXPRmMNOlpKCXx436PYdTxB684uuHYFnn6at0SjWNa
         2c4ArbfR/9m4BPehApl9ec78oWhP4RgT/Evbojh7BLPHg/PDjCMdx2XtOC3/+fCr+hSx
         4kCJFRWtAXGkJFA74OLDeCHd2P5t729HrfjODTI2pmS+fz0OAErXIv4+ch+mgFOm1Czm
         ov5WTlTtuYd1PV3wFTP9AYjslTpny4GFIVj5c/NDMmtJpmdw/kT5icXShx0Sl3q5FjdM
         xcig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769007835; x=1769612635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkfXslef5CleGTOMTYe++OlaJ9VsT1NdIrx0Bt2jP6E=;
        b=GbCPjr8u0SxkrNuOj/F+aztCCHfE5nwZe9Et23PvmkjZfL4RKDUh4WSOqoedBr9LHH
         Hw1PETrMTJsNeCxF1eqy0FlUkwuBH7i9JmVdG0a6bh9wA+of1Ty0d+pC6JqdqOCw1pBf
         i4XCZi8hYLgRdvEC2MDuyBaH/zrJH+/7CkT4MHypOyO/Aa6hxdJsaiUIkBetAeVlMO+W
         B95p3FLmq5CDKQT2T+MBwcJbZHNwL24IMtPagFbPJ2yF0eZ/gi2tKDRsxJ3OFYrVkhVT
         srzWEQeIXNXAABEP3EfdHSvVVG1DosM/p78pjkxF80ZM08HE+LeK+wDQNoeYxSaRzo1c
         Dseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769007835; x=1769612635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BkfXslef5CleGTOMTYe++OlaJ9VsT1NdIrx0Bt2jP6E=;
        b=BuxDk4djpHQJt5xFiGHpdzRkfImKQyvkFrmU+VA1gQaqQZ6DWsjAvl1M6St3WkqvWZ
         DpOLaSMY+vIFe5oRd7yvChJBH5YCYblgL1yodjly8ODNbGAA7dl0zJE3deRpsKAkIyQq
         j/yefe5uS0KwN3z18rRqGeGmofNU8p8P0YeIZ44jzm6QB5S+GMfFcd7qEQV6hREVn3Vp
         yHhMHPownbSAPYlRZvxkOVrkbp+v444mBwTtjm76FB0IeoeAXMRqw2dGZpz8lfbZoQER
         6EDMJmBvHoMfzVLcsWYBDi+AXmzwt34SXQavzo2HDLCJafuX0ZfV/hAcgndSnjDvZYtc
         XHJA==
X-Forwarded-Encrypted: i=1; AJvYcCUMJSuUl75MFvEixVBYuEmPpum67JtLI/AL0FDW4JoVtJQda2ZCa0+RjG0cK8ZC9vmCB22+765OhrlmtrrEnu8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+IeK2hYWff8aFGbupVETBTmL7Shs4e3DEiCUbndjZnQNIT0dP
	zZL6+VTSa7WwYnxbtNtICFgVQPyMEp/Yk5S01SfyNQINeuYi8kN3zl6q5wvM3BHFRAh8FPdw3C9
	xT3LVqBNqHybQo/KP9kv128lzcnNI7biLB+Jpe6sX
X-Gm-Gg: AZuq6aJ/Fx2jM9BYEJqaK1A06NO744mFpE1gCTtnzcUfhgLKW7n4w1ABL6x7tl/XnBn
	eLciKhnhb0TZqkYBzCxFtmydYnjP5r7yeWXLkOlWVAqdFQqm15T5/Y6FhwAZofDGELnXNQmIg8b
	jaESGWf3489viTVvrY5/efp3DlAB5g+9mA6sBkbvgaOOGdTMPj7i1qZID5Awv45j7k479t52YcV
	+25HUcLX/jEGiKLtllmSMTh44bBswFrfQmfzGY3cqggLVBuIeeD+dI+0Ui39H0DJLIxvuw=
X-Received: by 2002:a05:622a:180e:b0:501:47d3:217a with SMTP id
 d75a77b69052e-502d829a969mr66313571cf.25.1769007834257; Wed, 21 Jan 2026
 07:03:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121143215.14717-1-chia-yu.chang@nokia-bell-labs.com> <20260121143215.14717-15-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260121143215.14717-15-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 21 Jan 2026 16:03:42 +0100
X-Gm-Features: AZwV_QhPskOIydB8GymjUhQQqHYwHvz2ukB4yAm_VArjAbRnW32yObrkavrJhr0
Message-ID: <CANn89iL6ax4=xk1Q+KhiSRAQwCRpOSPVLTe0gwjBf0FBd0vm1Q@mail.gmail.com>
Subject: Re: [PATCH v10 net-next 14/15] tcp: accecn: enable AccECN
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, parav@nvidia.com, linux-doc@vger.kernel.org, 
	corbet@lwn.net, horms@kernel.org, dsahern@kernel.org, kuniyu@google.com, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, dave.taht@gmail.com, 
	jhs@mojatatu.com, kuba@kernel.org, stephen@networkplumber.org, 
	xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net, 
	andrew+netdev@lunn.ch, donald.hunter@gmail.com, ast@fiberby.net, 
	liuhangbin@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	ij@kernel.org, ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 3:32=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Enable Accurate ECN negotiation and request for incoming and
> outgoing connection by setting sysctl_tcp_ecn:
>
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> |              |  Highest ECN variant (Accurate ECN, ECN,  |
> |   tcp_ecn    |  or no ECN) to be negotiated & requested  |
> |              +---------------------+---------------------+
> |              | Incoming connection | Outgoing connection |
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> |      0       |        No ECN       |        No ECN       |
> |      1       |         ECN         |         ECN         |
> |      2       |         ECN         |        No ECN       |
> +--------------+---------------------+---------------------+
> |      3       |     Accurate ECN    |     Accurate ECN    |
> |      4       |     Accurate ECN    |         ECN         |
> |      5       |     Accurate ECN    |        No ECN       |
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D+
>
> Refer Documentation/networking/ip-sysctl.rst for more details.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Acked-by: Paolo Abeni <pabeni@redhat.com>
> ---

Reviewed-by: Eric Dumazet <edumazet@google.com>
