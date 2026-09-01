Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEE146D550
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 07:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248256; cv=none; b=jjz/jL1u9RkKoPpPT32/wbjtYx9fHebP3V3cnMpKi1eYWSFlqPpyoC51xSnbq/SoGMihWe9NPha5iDh1tZ31DsUf/FBcYtLIl2MYGcuf0HvZNMEK9n9RqyPOMC3yvCAi3BpTWyr4fdNm8eu9lB2zFLjjSHoe2lqNtqSDfWi0x9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248256; c=relaxed/simple;
	bh=CqfhTtR97gXh7eQqL6sBYYIKsG+QkBmqY1sau7tvQm4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hb/xbvLcYuLoN8L/tQn77VmKI2/YKRA+GiRzMDbHFP7BPrpPNRnvQEOEUTMeXNICAGFsSuPc+PSmv3uLzEaJsEvkdehta8ngcSW/uhRPzhGG3Pp3174uIRxWmnaS53Be+zs/wdBe46zCdBEFUxkR9hCkTwVDQ/1CakT+xfkLGvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HAgxpPSX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aU7scaYl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HAgxpPSX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aU7scaYl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788248254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Rk6MoM1HIB054uV59BcMTgA//1R4qE5kuR4lQOsz+qc=;
	b=HAgxpPSXqH34QMw3OoIQWtsBfhOs2S1NddDazbnQLuEKvhucxOdpU59z4gAtcrx+radTc2
	1DOFzI/MppuqCTaZ8NJhjJVOZlYQXUW9n4zcDdv+y4Exqv/5mJztp6BxlOBj09L+5MlR1Q
	YpPaBMfYihkhuSDW9Hp5eZVT9XnhAyA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-K02BFfLAMjedEJNj_h8STA-1; Tue, 01 Sept 2026 03:37:32 -0400
X-MC-Unique: K02BFfLAMjedEJNj_h8STA-1
X-Mimecast-MFC-AGG-ID: K02BFfLAMjedEJNj_h8STA_1788248252
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49991beee7aso40909305e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 00:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788248252; x=1788853052; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rk6MoM1HIB054uV59BcMTgA//1R4qE5kuR4lQOsz+qc=;
        b=aU7scaYlHZvTDCz/OPH2aL1ZFqJ6Zf++ydbS7X/h6oBJoDBfgasnXFFXu6CRRB5EGj
         GdTSjcVpd4ky2yraV7qODItM7p9zN1CCJV7kDz2pVj7JC+7h+FpO5YKl34Dnn1Kai1WW
         TDr4Q/XyfLkA8GqO0Zg9auBQquWVvJnrf4xUGCaOg8THyK6PH9vKUGiRQOAll+slOyvY
         IhDBieAoKzy+lnIYlMWI10ii15Cn3L+cMOYv0LQ05AbuNRNuh9iPOA97V5aOTEApqtgG
         lg0ZMH7IqhWBEAwIQt9TyEfY/UfRwjXYg3oJEZAhPv5K5op/0ShVfYuzMQm6XwucZIZ6
         xp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248252; x=1788853052;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rk6MoM1HIB054uV59BcMTgA//1R4qE5kuR4lQOsz+qc=;
        b=edNQWImJQfhKXizu8dI/jw9crWERmRrW7uRgDH4YzC/stqeVfabCUpcicQQR/hsqge
         Ij5zmyqMZ/CK+uv08+yxHacgeVFRxhE+WAlRgGd1E4V+/0yeoycAmEbN7XPHpGp8t9Uo
         MzT56SC2ZYyXueKUCv2bGLrrND2nq69NUrecTjbHe8bJ3M+7Tn9S5VRVcSQiswa7zMk2
         13G6ILi7dJgSCfxNAtNE+O7iVG1t0GsnmHTlLH3li26223d3qx8KmUYASYvUXFq0Pjsa
         PXntgSbFF/u2JVMykDlQMd0AxYkEN/J+SZzknQ01Ak6si/nEzROLkroYRmvsvQpV9SWQ
         1C3w==
X-Forwarded-Encrypted: i=1; AHgh+RoFGK15dyw827ibgISHLWdlUwqVV0fddo2cSdrw+TDkH0sVVlMoqKyxvfLd6pv2s6vTTlkDKEFQoRsrYXR2GGI=@vger.kernel.org
X-Gm-Message-State: AFuF++nT+xBTUuqkZ7NiKFMoAoo81BZrUFIeHPfgZWvK0ta2svGjsJ+X
	Q2wTxyCol+VoMOOINeqx/M6vjIPrc6zD+nCCD6n/rWjJ20g2O6PQV7cmNJRiZwB9m/2oIAi3YWZ
	gJEhzuxclCFVR3rMZWgItrpMi/XXN/UHVOdfDha1GlcfNvvWeLqa7spypQ1zob4bWiHH33Q==
X-Gm-Gg: AR+sD134jooddMi9YEC9SCQirOfJjM6xyxUF/Dv2b+knbfRnJmsEaCpHK9MLR9V9V9w
	pyol2IL0ru/rBUmavAxE6LIic18tKnrUhzEV3ABDwlrTXaPsrxTc6FEYG/nQka8ybL58UjFdnMh
	ltMbL3FDV501IXvAVMZIJra4/bF4Ra4VpLDbWurZEz9YEJP3huj6SZZNXkqS8eKQ6jZy4+dLj0H
	RMO0Kirl46WOVx9sgoa2OnMMFw2D1x/RUP4FINoQ6xjvQPyu/0QUn4Ot2GoibxAb70ZBV1uJIs6
	4ae2aWeEnhvDek+UR5UeqjfKJv8L8bVbad3mp8EfQFis2fqxWbLs8f5Kh7sWRsPh3Xx3SuyK+uY
	xCLbxY2NFVvxebaGOMTh2RoxzCyBGrw==
X-Received: by 2002:a05:600c:a418:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49cdc558513mr101959945e9.10.1788248251648;
        Tue, 01 Sep 2026 00:37:31 -0700 (PDT)
X-Received: by 2002:a05:600c:a418:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49cdc558513mr101958885e9.10.1788248251168;
        Tue, 01 Sep 2026 00:37:31 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm286144315e9.0.2026.09.01.00.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:37:30 -0700 (PDT)
Message-ID: <0b0b115713a6d5a10d719085284dc7cef21ed892.camel@redhat.com>
Subject: Re: [RFC 1/3] rv: add per-edge dwell-time statistics primitive
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tobias Schaffner <tobias.schaffner@siemens.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Jan Kiszka	
 <jan.kiszka@siemens.com>, Philippe Gerum <rpm@xenomai.org>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 01 Sep 2026 09:37:28 +0200
In-Reply-To: <20260827072400.45734-2-tobias.schaffner@siemens.com>
References: <20260827072400.45734-1-tobias.schaffner@siemens.com>
	 <20260827072400.45734-2-tobias.schaffner@siemens.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-08-27 at 09:23 +0200, Tobias Schaffner wrote:
> +	while (dwell_ns > (u64)max) {
> +		s64 prev =3D local64_cmpxchg(&s->max_ns, max, dwell_ns);
> +
> +		if (prev =3D=3D max)
> +			break;
> +		max =3D prev;
> +	}

try_cmpxchg() functions produce arguably cleaner code, would you mind doing=
:

  while (dwell_ns > (u64)max) {
      if (local64_try_cmpxchg(&s->max_ns, &max, dwell_ns))
          break;
  }

Also, although issues are practically impossible, I'd avoid an unbound loop=
 in
hot paths, you could go up to MAX_DA_RETRY_RACING_EVENTS (already existing =
in
da_monitor) and put some warning in case you reach the maximum amount of
retries.

Thanks,
Gabriele

