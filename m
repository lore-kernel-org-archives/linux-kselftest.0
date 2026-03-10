Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623B842E01E
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 08:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132764; cv=pass; b=XiQPArX/OZxGTI450YkhjdNbnACIqFFG5IEmW/BahvzM6egRZs3EU5U89EZLY+mAudV4qUds2GDdh8g9KslQ/CR7vPwbTFM7SU81wPN6KsONX7lM49IswUURR5lDkBfsLwREdQZ0LxyLYEl2ZaQ3tqvRgJ7D94J4j86tRc+MwGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132764; c=relaxed/simple;
	bh=GWZ/M5s5NCER/oau2EA9WTqeml+PkjCSZzT7Gq/KoYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=taiiAevfVFT5ctjIjYT7knLpWAByTZgJ/5Nv+J464+wfKpriUL8VXRaIdpSneJ71Ce7ZSyJhPtyU4oDn3VRSQnuT8bLaAhhFDW4xXfRodKfn1lxDPmShJiuZ1FDudn0n5RGXaSuMfQNAPUf8tkqzOr1I+6w7qb70ZrPMKw2q3aM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uArXlFKp; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uArXlFKp"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-509061dab77so29959681cf.2
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 01:52:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773132761; cv=none;
        d=google.com; s=arc-20240605;
        b=MUye+nxgJENMXKUCXre+VAVKfU/HOWekn2WfaZcujjyhwcsnesNFK+AaiJOa0FPs8S
         O0shz1mhfHHesIHe5fySqaPDCtBKadHkuC8ZbTTifSKiomVzFTMR1nipJQ8/rYxUjLZ1
         Oqkc3hPX1tYwltHrIu2X3zV5nViMSVZcyp7XnbaghEQdbmS83WH3jHi8dJQH9n1R/nQl
         M9WP+T5vUOxcnv3YJ8XFBs9KOzjwyYyaUSrgPqvJx+Nt8M52EGnXuYKSCMpDnLuib+Hq
         s6EyG4yBsoEybHXMJYihEs1dYzPogrWeN7hlK/CtXYhUVG10L45EeXmQ+sVKfNCo0PHc
         RAhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GWZ/M5s5NCER/oau2EA9WTqeml+PkjCSZzT7Gq/KoYs=;
        fh=cyH8xm3k3Ka7r7VqU7SYTW4Qefbz7DPVLOakx/vDbiQ=;
        b=XE1VFlwYrAq4epBXR12rzA+/WZOPApXFUVAscp/EWKhEl1fRGwS44jBB1MEAqExYqI
         hrqnBqlxwe3qFVHtHrWenyrrE/muW8XU7/aSyhD4+IYxAFJYqJuIrjXZBozdb9fbDHQX
         RReN7W2ZEpndI8nTifbIPy51NHTiRnm+7g1ocWbPUvUNljH8SXp6zmM5oFD97ikllQ6R
         1JOo819ztPW5dCWMvS1WPKKLknLUafRNciSK6PzMqb4jKAlBJ/T6hytCgfr/RvKiwcZb
         nxUjWekGDO8iaReDgXXSiUaBEF17fznWlnFPpaxmhmVvIC7zw3zR9x4NlY8O6GHFxhmq
         IhBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773132761; x=1773737561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWZ/M5s5NCER/oau2EA9WTqeml+PkjCSZzT7Gq/KoYs=;
        b=uArXlFKpdXlqKPjE09U/NpdesuwQWpbUrVISvbyzCV4L1AsHSXzQj0MCjt+cEt0VVj
         aqllWlGYfzBJMDKNsx8vLDQIK3/6XdLfDKM7ZKU2Djjt38uerxPm3YWuj6a686q4OB3Z
         0rDYPe0yCHGSq7E6y/cvMiET3Iguvl3FjTULft16Jd3SY/LyFUSkuVzXHIQ5odvTVV9g
         HUk5FbFqsZMD4uXraYuht1pWk40p6xhEroXzSuOUOT6y2liU0wRgbznY2/UznsuQ8W0j
         AizbepEM1kyGcW2r7d2sGynwX05yn9UhQFqz1tciVFGjYc54X59UA2Ai02fQySDhRtSz
         J1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773132761; x=1773737561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GWZ/M5s5NCER/oau2EA9WTqeml+PkjCSZzT7Gq/KoYs=;
        b=g93K6zYrein41kKmzAQlQPwuAI3j6fq3SubqZhmVYXrhh6ThsHVmJTWwIcilN9dqpe
         kE6KNx1hVfxrkWG8ZlcndQcooxivlUB2BrtyERutOElX8yl3Yov3pRJGOxX2cVi9REiu
         f4xymtdhGf0wigHGVmPRI047wNX4BCHnbY9dZlQjHOfyki1tGs6Lv6y0EJEDW/gtKr7P
         lGox+8jttU2dTWyDuav5VygVlsO/XWYvXYa5H+m38h1HVkrUio3c4lSymjuqlup4fQus
         vUhUqbRMytCv9SymoowMx4QUHdfu5Z1DSY54vOt0qC6a8CxMdbLWjr7uQOJEsO8t5mSp
         sQFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVop1IIyqS3Z6VKi9f5h8xCH6yY0GV863iOncktBaALraIceA2vRzgYsQ4o02ETczuzuY3XIo1RyJ7738UUP0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxli1DuNOnwE86G+NmdaOATwlNVZxlVKZrGZwnRJnUIGoI5lV7
	n7WnBbrnAhvU9rFPy+pXs5tS7ekLL1/ngp1P4IxIMgA5ehwUwtcisk3b24D6eemXGJyIXDvEHtY
	8rkdWfkfMeISKxIJOT3g79hYzEvSCdxWjv/lFTwyq
X-Gm-Gg: ATEYQzwGc/iBFhiDoq5c/lARLwwxqGed1W2xRBy0fwRKlJjev+oE+N8Vsk7BoUdb4v1
	OTL7umkdRMenIduk+sz2vVnK/MLLq9/RV67dSqVIarnK8QoVoUmwEYCiD0D48KrcUZF0qVxnKpB
	9emR29YXR/qFVqjZb416sv2Z874aS1s+mByQVM0BhO5DOdnJ0m1Hv3rEj9qxI08TyUqYex3XjgT
	QMnoDTpKQw/2NvFStNMnyMXgkH3TFrQ5F9ttgoqQ3uWt3Cx79dPD1BSWPhdLV616di+1R3Oqavb
	r4WYXc8=
X-Received: by 2002:a05:622a:1495:b0:509:f36:496d with SMTP id
 d75a77b69052e-5090f364cfemr113018421cf.33.1773132761084; Tue, 10 Mar 2026
 01:52:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com> <20260309-tcp_rfc7323_retract_wnd_rfc-v3-5-4c7f96b1ec69@gmail.com>
In-Reply-To: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-5-4c7f96b1ec69@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 10 Mar 2026 09:52:29 +0100
X-Gm-Features: AaiRm53cOsmiV2tykYX4dD4wvI_-2esZ5FOIQTDvQaaas49mugfLK5wzrAfT4QA
Message-ID: <CANn89iJCR+nO6ZdggkCGACfQ-Tbru1nq3_q8q4QTp93faoCPug@mail.gmail.com>
Subject: Re: [PATCH net-next v3 5/6] selftests/net: packetdrill: add tcp_rcv_wnd_shrink_allowed.pkt
To: gmbnomis@gmail.com
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Ahern <dsahern@kernel.org>, 
	Jon Maloy <jmaloy@redhat.com>, Jason Xing <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com, 
	Shuah Khan <shuah@kernel.org>, Stefano Brivio <sbrivio@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>, 
	Geliang Tang <geliang@kernel.org>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	mptcp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 9:03=E2=80=AFAM Simon Baatz via B4 Relay
<devnull+gmbnomis.gmail.com@kernel.org> wrote:
>
> From: Simon Baatz <gmbnomis@gmail.com>
>
> This test verifies the sequence number checks using the maximum
> advertised window sequence number when net.ipv4.tcp_shrink_window
> is enabled.
>
> Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> ---

Reviewed-by: Eric Dumazet <edumazet@google.com>
