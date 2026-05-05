Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13F730E0F5
	for <linux-kselftest@vger.kernel.org>; Tue,  5 May 2026 01:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777944195; cv=pass; b=qCby6Ie5Utvg1dhQi7b4AAPpdSY9lueRnyAyP7CVq/tKuGcqWYuPbUxI11FmW/rCTPp+PwKCEGf+9K4M/DQSrNv55Egbe0+6YSqSWcNVtlSqLZv4PeL8vsOX+MxWLMwBAzRtFOa+WrmDXI2Tm3qOZST0DHh7i6IDRGc4k7OCvvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777944195; c=relaxed/simple;
	bh=Rr3wU4+uo7PsSxYrNtmT6CjW/2oWhP4X5/7X8ZQP0tA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L1Qu7Y8b6jorxxuO0cawEws3HWk4kZBIQen7WUjskq3ewR26uysyQHCuKZdoBDCyhBDVt6mtEDODdk2sjDEGZEKL0VK2E8iHk0cwY9o44Yght8mzmxCYq6wm0pAjRRsvHRlDTlQL+7YWqc8NwvFRFRh+uG8XTORzoUMR+jAzVus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KL4gnMYl; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KL4gnMYl"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-67c2b4809baso4144950a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 18:23:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777944192; cv=none;
        d=google.com; s=arc-20240605;
        b=JKZ23Dv4CTUWPjO1uPclsavXhORE//JKWfBOTkqwaJtvGvydu+YIUIZfQ/qZx1Bep+
         cq9O6y8l46e7/uHBpC/vZiuPHQQi/YEmDVTo+79okxX2GH4nMfCXRadlLCqsVQervHVZ
         meU3P3Gp7+sECGB554PGbk9vFG7me04g3NP24tAezVmR8B3s3laIbcLKF6XlVHteyZYR
         +kmL6zuNLidZqayw5T7XssUrLlrZHem7sXCr9pS3mcD9rwnyei6Ep12QGr/L/wH9rNjG
         sAPKi2BSZuI+GAvKrzUHXRxn7yezbawxYSdFNwZBYfO8QQgQys1dXlrrpgbrq2aXvFUb
         RdRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cCXrAWmoAymL9ifKCG4c/wEuHOu5FPfo6N65MqG9vPs=;
        fh=0N9RsuaabRUyda9hxkyixhgPPI5kk2C95MOehC9B7E0=;
        b=IlCjUOyMe7YhilQSn0oZ7lydkuomcvO+FpZKyPafCOBXkr7XzQVRGJJO7DiLQTC6QK
         DswJaDYDZfhlTU2Kfdku8AqUlh3FIN24LrDQJdxl+i8spet6g10yFObGFxltIJgQZJ89
         /lkPCsnW2NVKt/ZEr0uqbKkvrct1k3HfGYafspimnmXBYzcAkAJ26yZl5lUwqbZ3OMUS
         Hlvozdjq2V4NeaOdNHAeQvX8kOV1xmEOUfVcgQgUh32404YeqVFo7BeqNznSmMxlHO0v
         8VAPlecebd3YOT//pDItHpY9pWlPLcc/lLKdNiRc5crBJjy54EmrsTqsTPb/XTZ0A6b4
         qy7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777944192; x=1778548992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCXrAWmoAymL9ifKCG4c/wEuHOu5FPfo6N65MqG9vPs=;
        b=KL4gnMYlcA1PF8bTf7kOe2sd5FK3/paFvLZPyIrGLO/mpUp05Wk357vRzuAVydpSzX
         fHLbvt2C2I7+x8Nc83g56+DwMz2fIJ4bxIC0suemFM5i9FulLwqe7Nb/3xHpaMeHl03b
         9IDX+bvC2KLMQDPuSD7PwNN7SqpfDQ+iKXase/bJmSEFlYE7g8eKnc5qSVvJCTAHEbKQ
         m7iixZKURyplgTeE24eOIsNftklf9pyN2rR/PDdm4fHlwp0l1KSIStQf3pIxV2cY++Qs
         Wa+/E6sB+cdfVjMLI7n51C2VVKvrjMQILqbdBfIr1mq7BkhQpdDi3LVet4vUo2v4eVe1
         NElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777944192; x=1778548992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cCXrAWmoAymL9ifKCG4c/wEuHOu5FPfo6N65MqG9vPs=;
        b=mEvZsgl1Re/lJ+3DqYG3w1inS2dYJMOwnV1rSwOlxgCSpF8BXiC74C6/E46e5TGMSo
         X8seuAwamV+nZruxXqE6vZebsVP6+sPky5+/9HlJXaU7mU1wHFgDkM34xXNK+69anif/
         nDGp/TBoHtLvgcQG8lewTBctyz/feot32eEdBxbD+G5A7NCLV7JA93GGu6AkscYFhdmx
         8KgLI2TnTp24YhoLxFBsf3VNo4eQ/zpa1yNQk668vIPMo7HuKjombk7scrylumRDPtN5
         o5zhUAOLK+RIuWUIoAJVJlgTpHXoI/dvDw46tUYqd1Mc9YtnQETxJbhr804fek6d8uQ9
         UzSA==
X-Forwarded-Encrypted: i=1; AFNElJ+WLpt+4yq9DebtGy300IjQGMxSJiRAVcYqjC4/+VZANS4CY8WQyPg2AQ5AxqaNvE2BJmD1U+5+9brHpqmYYDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFQhit1ZaWpcQNYfhgyOrZG0Vp6mOVjVSlonttutmJfIlqgrci
	xSQCGaSJNc7JZnq6PJeZShi9C0p4jLa2u19+V5tkgUIUy505cGEzBXztlf2BesgLEPDJF+RbSjg
	xnbf/egs/OFZLywmeiAZ4ubKDBuZSW3c=
X-Gm-Gg: AeBDiestCVPzReXF5BiwofkEvQWRUned9VjWZOqEHDHjlVtybKPRhcGVKiAp1ya/5Xw
	GptRx0vjceH83Qr+PikxEHI7LxJzWP0iKjhVs6qaAh2ZAtFy1eJz3ZChhGyDbo6meUbrZeYuaLP
	WwMvSk3Jtuatvdp+j/xfjt4QkBNX311m0QG/eE4Etg6G99LQLmuCs7UDwRE82G1b5Mc52329rD2
	TVf2PJQMcqJjW9dLJLGRUYWb8Iia7jJKwygOD/voVeB9WtrfSYBfH9kYuJURLIq1BnuO39cbJz+
	s3vkO9f8unHe4Bp4H/8=
X-Received: by 2002:aa7:c904:0:b0:66e:43ef:2951 with SMTP id
 4fb4d7f45d1cf-67c19929fdamr4132069a12.4.1777944191864; Mon, 04 May 2026
 18:23:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505-seg6-mobile-v2-0-9e8022bdfdb6@gmail.com> <20260504163915.4a8b028e@kernel.org>
In-Reply-To: <20260504163915.4a8b028e@kernel.org>
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Tue, 5 May 2026 10:22:58 +0900
X-Gm-Features: AVHnY4Ks42sm_qgbhHJDSLEyR_36W-fEa54mnTPR5nGVrmyYGFlRodbG56Qn8nQ
Message-ID: <CAGCJULP83NnaX6HAqwb3umDXsxN8LH48_gPpJ_3gG8_xA96QNQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] seg6: add SRv6 Mobile User Plane (RFC 9433) behaviors
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrea Mayer <andrea.mayer@uniroma2.it>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=E5=B9=B45=E6=9C=885=E6=97=A5=E7=81=AB=E6=9B=9C=E6=97=A5 Jakub Kicinski=
 <kuba@kernel.org>:
> Could you switch to posting this as an RFC until you gather some review
> tags? Our CI require manual intervention to add the necessary iproute2
> patches, I suspect there may be some uAPI changes therefore requiring
> iproute2 changes here.

Will do.  Yes, this series adds new SEG6_LOCAL_* / SEG6_LOCAL_MOBILE_*
uAPI in include/uapi/linux/seg6_local.h; the matching iproute2-next
series is posted separately:

  https://lore.kernel.org/netdev/20260505-seg6-mobile-v2-0-93291b7b0134@gma=
il.com/

Just to confirm the workflow you'd prefer: should I repost the
current series immediately as [PATCH RFC net-next v3 ...], or wait
for technical review on v2 to land and fold it into a v3 RFC?

Thanks,
Yuya
