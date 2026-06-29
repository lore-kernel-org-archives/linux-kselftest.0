Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901AE42848F
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 15:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745718; cv=none; b=vGYGNMUSHdVciXal+qmCwZr+0/7OIPZOTcRHiZ3ivY6REuG1JQzYrQn+Bb+Al8aeIftl4dIqLx3SB4kzp3KhnOY4h5W8DVhcaZ2XSoMXVOeGYIb9zQ6CpxLIJCFc7pg1mkLX6W1hP7Z09qEDAmzOH4gpbHLo9QyfcqSAseI0Pyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745718; c=relaxed/simple;
	bh=lMco64SlCp2iFk0E6dTwrSjmt/kwqJaHvhyZAbJrpBw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dnK7wc+peXHbkFZOQ17yhuW6JUcHx51c1zL3aTpG0mck2r6+Q9zxOGVIjCd2a8TVrY01Cavovc57JEeHKHSr9QVVJCxqkMQwzUph2ZtSHjUBF1fKDiHNas9bRPVCgIc7EeograG4rYCaKPbCF9XgkUv7wa2us4WmsCGR2Mf+avI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b5ZbIrUt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=s4+DPnR8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b5ZbIrUt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="s4+DPnR8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782745713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HnLlIWAqKGkYvHzL3qLHQR1QHqWY2RRH9mZcPadrEj8=;
	b=b5ZbIrUtJ2KPwudBIEZBC+5T1uJzJV6MXH0jNRtzanYo17gfx1U1molluh9joC2z87eE2s
	aAYoxC2kalUKGhUIpnNdnFcRfMMw3cgDTollCteWnE/qxSmKn0feKkLP/VhAXhw9kZCY/4
	P1Zz2gM08ndW8sM37VMzL2rQcEe24hQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-rtsTT7nGNiKr49-SMCIstA-1; Mon, 29 Jun 2026 11:08:31 -0400
X-MC-Unique: rtsTT7nGNiKr49-SMCIstA-1
X-Mimecast-MFC-AGG-ID: rtsTT7nGNiKr49-SMCIstA_1782745710
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c1276292eb9so68005366b.0
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 08:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782745710; x=1783350510; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HnLlIWAqKGkYvHzL3qLHQR1QHqWY2RRH9mZcPadrEj8=;
        b=s4+DPnR83b0302ZQ/XbDG9FJWKm66/FR0E2Tlg9H3b/w4BTuI2Frim1fxSaFIG8ztP
         smo+AVNGR2y9gq2sZJHoFVpRho5ocPMZPsmJwGD+xNvT806U8gZSwZr6ZYH4GHstRyi5
         4TeBlPCHo6UuCveZkGsP1lNtqaB1F6JTyptugqFfBpo4SGbb1tCm+7Hf/Tk2QWgbIH0v
         OrSyhPwG/r+Qivl5s0AvVzNIzlqwP+DnTHjCqR/ptzC8Tyovsb868vWwiO2YFNa9dlpS
         yYGzOpY/vY3O8rYWWe6kd8X3R0R4gnq6Eg9T8cJag66dYR1PPvEi+ovmv7ddEGiMk71K
         fekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782745710; x=1783350510;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HnLlIWAqKGkYvHzL3qLHQR1QHqWY2RRH9mZcPadrEj8=;
        b=DB3chwxYRkt5Io0p+NJ1mxcDlKz4/pvFCM4PnoPAUoatf1k+LJXu8UoKg4qpuje8vi
         Ke7vPOcAfitl6ZgWv9Y6PFLwqWM4KlC1MmlpGfHcWjOn/PXt090EJzzyVeLiLykCCELP
         gZG3vEbATpLwdacrWDZNirAIOuq8fpuqFXD7xPsXndn5K5Qpe0FaXkNVqfKkQklHZsx5
         5wPgBlcaTf80nyqhaeCZf1a6QktwG99FGra+FmKFrIRWDd52Uo2JYBNFdQPNpiI30MZY
         X7CJ3Se2uVmolMYowlvKvC8a/2mCc5TykeAK+vNCCqlQOyXayLeDKGaYpv/YsZBH4fiK
         EaxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJhbKhr/A5yFfnN41UM4LyOpT8BNFVFyFV+iIo0KStlEgFx4eMuJ4CRm1s+VF4wcL5vlVzPuyjwQOX4RyJD+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPfmlRSFWHqt4gAgl46GiupXz2mWoJuBIeonSIZy8LYOYcHNjm
	MPdCwfbzTxGY+aYxnlKmQMhpkJwmpC3ordDBvUm4MStoQAgwLgo7eScKV8d9wFWfEi3BvRcxPiP
	6eL0RVxdd+irbisdU6PfG3nVyX24s24Ef8xMAzYbXeLM99WN+6m9CWFISyAhpwTSyS/fQ+w==
X-Gm-Gg: AfdE7cnTHZOrcGU34+w/4CR9FU3P+uLQniv24NdBQufc8unFMzfhUxw1b8pnhPOjj4J
	6o+9dOqdj3r2Q/UI0iT4k2XjtddJLjkyNCR0tEhgLMQI74K0uJFiM5l9P8aftq3KHJ51SdY9dbE
	ODCRONKbkWDEmFoxx+w6zOtvrORyIo/wcCHgbeSUVZrThQvS5xCI3o9jiNwJfRp32AUpOm9pjJF
	PJLNDRiJThcxdfVl/0PbAvU0Yk83yYtnDFr0hqieaW2gWOs4SMsdZjxcVWgRNTsHBprjYLrdn5M
	9g7JiXwFy+SzftVB0oVOozySxyupHo6UD8fdS0usY5vWAh2O3QEa6GQh3AeWfrGpXajfGohRpkq
	jG/k3anBsxhVmE5qoKGH0q+7bERwNJdiQMD8EuA==
X-Received: by 2002:a05:6402:d0e:b0:697:f70f:8238 with SMTP id 4fb4d7f45d1cf-698774b8165mr465864a12.4.1782745710428;
        Mon, 29 Jun 2026 08:08:30 -0700 (PDT)
X-Received: by 2002:a05:6402:d0e:b0:697:f70f:8238 with SMTP id 4fb4d7f45d1cf-698774b8165mr465847a12.4.1782745709965;
        Mon, 29 Jun 2026 08:08:29 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk (alrua-x1.borgediget.toke.dk. [2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69848e5ebc0sm3512223a12.3.2026.06.29.08.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:08:28 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 639C280A267; Mon, 29 Jun 2026 17:08:27 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: David Ahern <dsahern@kernel.org>, Avinash Duduskar
 <avinash.duduskar@gmail.com>, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org
Cc: eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev,
 song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
 emil@etsalapatis.com, john.fastabend@gmail.com, sdf@fomichev.me,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, hawk@kernel.org,
 yatsenko@meta.com, leon.hwang@linux.dev, kpsingh@kernel.org,
 a.s.protopopov@gmail.com, ameryhung@gmail.com, rongtao@cestc.cn,
 eyal.birger@gmail.com, bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v5 1/3] bpf: Add BPF_FIB_LOOKUP_VLAN flag to
 bpf_fib_lookup() helper
In-Reply-To: <d820adf6-4a33-45e9-9cfa-17f11a37c9e8@kernel.org>
References: <20260624030530.3342884-1-avinash.duduskar@gmail.com>
 <20260624030530.3342884-2-avinash.duduskar@gmail.com>
 <d820adf6-4a33-45e9-9cfa-17f11a37c9e8@kernel.org>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Mon, 29 Jun 2026 17:08:27 +0200
Message-ID: <87se65bd04.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

David Ahern <dsahern@kernel.org> writes:

> On 6/23/26 9:05 PM, Avinash Duduskar wrote:
>> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
>> index 89b36de5fdbb..e00f0392e728 100644
>> --- a/include/uapi/linux/bpf.h
>> +++ b/include/uapi/linux/bpf.h
>> @@ -3532,6 +3532,29 @@ union bpf_attr {
>>   *			Use the mark present in *params*->mark for the fib lookup.
>>   *			This option should not be used with BPF_FIB_LOOKUP_DIRECT,
>>   *			as it only has meaning for full lookups.
>> + *		**BPF_FIB_LOOKUP_VLAN**
>
> This flag should not be needed. Patches for vlan support were never
> submitted (I have them in some old branch). Since the vlan params are
> initialized to 0, no new flag should be needed. Besides, these are
> output parameters.

There's no enforcement from the kernel side of the parameters being
zero, though? So we do need the flag for feature detection; unless we
expect applications to do that out of band? But then we'd need a
mechanism to do that which could be... the presence of the flag in the
ENUM (and thus in BTF)? :)

-Toke

