Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318AD336EE1
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 06:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775801373; cv=pass; b=hFcWSZwXbkg6rn3kCRBGN63S5dPzr+XccXpf4j5OhEA0u6Ho9UORA+vrdHGh1QKYniBRlR/BIjSQ4Ows8UmXVGr+iWPrOBWcHZAPJZ7g++i5WGL/ACNwxXUQoWBHfY8xBsXzL8EUfMsA/N1T+wi4W+t74silX5HUt4Ger5nTZzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775801373; c=relaxed/simple;
	bh=k/9wdMzrz0If7hXNPFdNFIODdaToDO3f+Lk8X4NPo9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D/RJCaayhLn56+QmXAuXbW5dapSilG9JqQbNdQCA+dWwKJuRZOwV/nldFcOt0ZRZpCO0jY5NQ33IXPwsA2Q04fgR+W1N7HN0jLuc/lGB1oG9PcvNqlfUAu2ubZxojYjwsQJUETRKNfXzs+I9AbbjmLlXHpEfmyBhxyNxh6E6T7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dTLN4xCT; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dTLN4xCT"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12bfa7fe691so1119293c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 23:09:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775801371; cv=none;
        d=google.com; s=arc-20240605;
        b=DCl0h9Tj7ZTtykK78Dx4fcrD+nOKX7vf4sJeqcPETyVx7omWFslqFepsF0fM4lI7IG
         qkAP3+aBxTKfa0Na6FXmfNIhYS4xXSNBezJZ8qcSwiaxE/C67wUExrRnwEZYqXh8MED0
         sFxbd6cK8eSur+iP2YpIw6yHwD31CcP5jDXhtXlW/4Hgl8OM74y8ZZfpRxEfMSUpX8VW
         T2mH6MdLGY4g3X61GbN+0QvfWmKUcpUSbYZpWOjcZzvQosYGlmvyWHidJd45f1w3TEto
         QvuoPDOtquMNX5RnG9MSRVHNSsBqTjsAGucVSMku9SBhgrfbe2AZfxeqVXkcO1Tc9Fun
         fMWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k/9wdMzrz0If7hXNPFdNFIODdaToDO3f+Lk8X4NPo9U=;
        fh=vlWYEq7D3ChpGI6zJMhswnEDmNczVT5fxWcicj1WMro=;
        b=Rwme0eIhC8XxDcbRZFsXEYCCjs+IepIy/c4LmwaRw7CoH9XRfRFmoZWe5YM7ZmQfkM
         cZS71WpnYFo+mwS8r3nMhHpXuHOJQkkp5Sp4CrZReNmQwhtvV2DJAFITepgQfOMWijBO
         R6IuSehp17GR3xfft+d6meDqWOD5OMMf0F8eBZ/11FAJG56ztr8sZIP3OMuYJeo3ixaR
         f7zYdc/cQMCzn/RNYMLzwdrbcP4SlI+YVVr77qzBDmoU5ZWstN9r8xQHKa9sBkhEhs0u
         UfRJYATsdVoU3kXYEkGTKiRY+vVV9PQXobJ/GuFzqjXqix9d83L70rIljw0PLCcu1sNZ
         +81Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775801371; x=1776406171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/9wdMzrz0If7hXNPFdNFIODdaToDO3f+Lk8X4NPo9U=;
        b=dTLN4xCTmR7i5xn3nRBJ/JHi85jDab5Fa533fVEyab845DrTaiaqsNOdY8dEAia36l
         dyNVW5tSHl17rSSwK4Tz7EzqFfuIBCdrmSnFhK2J7Xi7mfr7BVE1fLN3c2+vzUBrAamt
         ZgLGcXjYoRFQAbw8hlFD7WzTBK7J4W2bgeVJ0SyMz3808BG2PRD6AGNIdgrCbkZyHnzc
         UY4KmedTRq/LuiQ+PMNHorAI1zbncgKx2JO0/wmtPimtyDe1tHuR7Xo+KJ2uo6cL/AA9
         B6Rzd/DQKU+1zX1mqdgu7q7BT8dVxdkuKy+FT6K7Ed5jcxu1dyGqECly/hb3a4dNcpvQ
         5G2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775801371; x=1776406171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k/9wdMzrz0If7hXNPFdNFIODdaToDO3f+Lk8X4NPo9U=;
        b=RKmwC3GzRbxND5Sia2edEY8hbwarlECBFmNIPq58ZA0AsD/HMSX+aseJBXcDdHxvXL
         Wet9QaoNg2xj334Wmm04KA5GLBj7UsRkTI9bMuJ64B7EKQ1zwuEzmWDceRjbdmW+hhje
         aZasB3YzrXJlO/U3wxdAbjfm7x9MmPaHLFN1Uv3k0sclDIAhzMCsMKbd6ALn50a+bG3B
         ggsjrmdarM3LT9y26b3FtvPREwXf3IwqGJSLOrV0LeGq26dlGtWqp/T5GWkapVOcazkS
         ILTWifbCnomOC0z7i6NVhxB+w/8NKXa2if0iZObPyCTAcQWyOewnVMRRkUma53K9L6cU
         7wOg==
X-Forwarded-Encrypted: i=1; AJvYcCUdkxNTLbZMfdg1eGPIzh+dwfNRfKOKgJy03hdodItxNe3HXzUo10iT9dgnCmsQwjJlJXfE10Xrp29bYOy04F0=@vger.kernel.org
X-Gm-Message-State: AOJu0YztgXvAfGjhFCQHY5wLhTHcg7RABAw1A6ppTpoUoQdsP1B9yytW
	2C2hOiLPZK8cCpIU4rDA4c7xQLkUBVeVTrET1CGPdCnuR0enWHfPAEbBKJWtfmhhHryQprYHMCb
	CdCUlpDx4ZyhFTIYZ0irh5p/vSnV/U8q0Oi3T0lag
X-Gm-Gg: AeBDievvZZWP3c7oBgwlbXKxGnIofLmcD6xBGyfYLDHvQfgVffcodtlz2IjvmnNNHDZ
	ogyV7gFZCpE/SlQ1viDwZb+eylSoEi8l4raH/O+gytVbZ8lOTKK/0sffub3OO//026PmcKAWNP7
	e91zMkvAcsOo1LaBQweyqHMUd0n8c2Eks/HF9uhjasS1AylQgSpEgeETylL9GvozDeEKCHvKGso
	hMXiLa/jGJKDv2TZ9Am+aB8veAPBNcD35gicm1MnSn5olURwp7UQh0wpPBS6UsERAGk8mYe5q1N
	l2ZP/Yt7+ZguHU4G4hIN61D+LpeWjGJlc9Bzm+UHs0jnSkky7etyM9eyMWbR0R1xKyrurAdDo4L
	cv7lMmOs=
X-Received: by 2002:a05:7022:e986:b0:12a:6fbb:3353 with SMTP id
 a92af1059eb24-12c34e45172mr1135238c88.3.1775801370826; Thu, 09 Apr 2026
 23:09:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409-teaming-driver-internal-v7-0-f47e7589685d@google.com> <20260409-teaming-driver-internal-v7-4-f47e7589685d@google.com>
In-Reply-To: <20260409-teaming-driver-internal-v7-4-f47e7589685d@google.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 9 Apr 2026 23:09:18 -0700
X-Gm-Features: AQROBzDgXsicMjn8BsOTGzlWWo-ihMHv4mp5OD9b8UmWk8fWiTjPTQ75KqeAXcY
Message-ID: <CAAVpQUC4PfRjs2wwRCGJJhkyoLitHVr_4ca6WNgujZwJwXU3Nw@mail.gmail.com>
Subject: Re: [PATCH net-next v7 04/10] selftests: net: Add tests for failover
 of team-aggregated ports
To: Marc Harvey <marcharvey@google.com>
Cc: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 7:59=E2=80=AFPM Marc Harvey <marcharvey@google.com> =
wrote:
>
> There are currently no kernel tests that verify the effect of setting
> the enabled team driver option. In a followup patch, there will be
> changes to this option, so it will be important to make sure it still
> behaves as it does now.
>
> The test verifies that tcp continues to work across two different team
> devices in separate network namespaces, even when member links are
> manually disabled.
>
> Signed-off-by: Marc Harvey <marcharvey@google.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
