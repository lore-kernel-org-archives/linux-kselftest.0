Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFA543CE45
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 10:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382476; cv=pass; b=Wpu7qJ6Gt0lOFubFay9ruFb/n2fzld880yXZ7WRKaCG7AoQHbR3LUWG3e/OelZr+U3jFHHRUUfDOLo8BzuZDuKDRw2kK4vBjuJ8K6nGvC13YDJI24ATovVR+1+y2bmZNu7e8kOuD4fuv83Y2gLmCiMz7uIjrJr9jXoV0q61qZ+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382476; c=relaxed/simple;
	bh=iJOn1fIiQ2XA2NbGR5R+22xMoshBHH07wVpWChHZaPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5A2C8T+4D+ev/92ixDns68gf2iftiYKDVtu6sq1gFdXC/2Fw1F4HhXZTVndMoZIGaWMI9kO5GLIJia7NqRs8Pgc/BT+hCT8rxC63EY6Qo2Z1WG7E3QVc7/LOuQSPYwromqSvTxFoGD2O59a4VDt4dLZ2FUDgO4BOXmeik47S/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KWD+j5yY; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KWD+j5yY"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76c9deeso31772011cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 03:41:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789382473; cv=none;
        d=google.com; s=arc-20260327;
        b=ABfCnUR0hq9hbU2+d1UwpymbSF8G7M+BWITVvexe3u7YbTxV/LCe7oSEVBOY8QEn8a
         0qnAfMKiq+ddhOUdwHvzDVyL2K9IpVAVnFnLXgJsg6TE4NJWJLNUxx6dToexVN+buR5P
         3jBtl4+PrqM/W7hSxaRhqaPy6lgjlZC/B3XPlhWBqOrYp/j5K9ve1I+EiluxqWPmrA3K
         /atw+8nsStXmuRGU/ZVb8ZhSp2yIThLNFs1LZXszcFNUBw2HqTR3dm8m5u0Fw8wbF4j+
         MlexhU7lLs5JVv2IacCUKP9J6j5pYus6vRrXDWCTUA9FK+h2g0F/0H/mFCd0Pm+pKJa8
         h1KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iJOn1fIiQ2XA2NbGR5R+22xMoshBHH07wVpWChHZaPA=;
        fh=p1vnQrWqu1fO5EXtkz+hoMs249x38VnOijYgnr5v+iU=;
        b=Rl9pgsguK7InWrwHQSraa65LrHkx6TqmLZgSYf/iDx2caTlHI41qjotv5BgGOeGVKd
         sngH15EnzJ+18YC6Xsd6WVxV9udrknm8nZ5Y2y+6TFipHeuGPIZbdvmSy1zw7WzjtVTZ
         z4V5/76WuHXh4H+bFwkHn2xuS5wbU4MMz8Z5a8eoQ2A3UA7nrY4ThGSKf+kuv8TnVFDO
         6Q0zVPiJw1H8MzN5rUTo/a5G3qmVqT8WugbEE6AjlWUtGfkGkw8BxGS0il7L/Z18RMqc
         TMDKGvQn/FD7GqJ9Sy5ZaKCv08K5Vpia3lyKfYVb82psjPlZS1+4JiEDd0xwsLOEjesx
         3vhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789382473; x=1789987273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iJOn1fIiQ2XA2NbGR5R+22xMoshBHH07wVpWChHZaPA=;
        b=KWD+j5yYSlLTfjh6B32lfapLcW1WLl5eR5RwpQSd4k5gd6M8a9mAfJOwod+FqhvzLE
         4JRVDnX11YIfdW54L+ZvOzyTlFJZOF7lpzKghB0Dpg78uoExI8Wv+srv3K0qNM/53Riu
         gmqooEuphLPD7EDxlqGoXGuEIeD+1VJD07FMbHnxvUhcSbKNzvP92rjO9wMz7DYssNza
         Du7+KelOOY8XnZIUlaTkdJ1AKH6Mne7SJN9ExlzSa+1mHAUTxyT7GcJj+zL3elIqkEc6
         z/B4NHeFrtV0mCGr4kXhHcxllc/nmB39LFYp8lIhWuMf1IZRqmMKc1N0JqtvRbCHOeHI
         DD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382473; x=1789987273;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iJOn1fIiQ2XA2NbGR5R+22xMoshBHH07wVpWChHZaPA=;
        b=YBgK+GcafLs1GdB+nEEfDomAQkIeB6MR2enGDGnnQbxvY9mUVhYfe7DFPZZaQDYvl6
         I4GNSAyW9yfm539duCc4kK77BTYtD3NNVlEJ0gVzhn543UM2DpPsLW3kDzMfPZz1payR
         L0Q5NDTdfQauwZIWhxDVOgxFPyLUBJGgd8iLtKXjjUsFh4coSLCe663PJ9drvbvDxcW6
         zcD8u5lKeUGK8PQ52p2s0nn6M0u5XvirHh1enWoq7kpzJxIheC22fkZBhZZ84H2xsbW9
         4IZcqpQEagX+Kt341u84WXVtE84FpHrb5M2dPpeJPGnHYqI/AIZnbsUN9NGtkHqbR+/s
         4VgA==
X-Forwarded-Encrypted: i=1; AKwUvBzu4uZ8KoDjXxalmsUW4jhC5XUkI1UZviRNMR/LnIOk/U1qSIzDwvT54u+DM/hKUngZKJkp7HFzGgVtNJR9+k4=@vger.kernel.org
X-Gm-Message-State: AFuF++lV8Kz65t0662wtugSCu2fb6FVW1XdG8FIv4OSKRN83ayYhsvbn
	i/HkS9JnFxQETZoJ2YNahOOhCltQ0YQumLBp4io2vfNCEmqgapT6X3fdi6siY1BaXECED+T23H8
	P/EjKApTnGipHd161VzRQ6OaPvHCr+t0GVITnxYFu
X-Gm-Gg: AYBFou1WNPCel0FPgLlnxmlU8wmNiLri7rSovwjTYY1ABZ6UcBHZUrNW7CqEIYor12S
	RhCMTGPcspog0u0I7Po5yJUNhNqXM7W5UTvSF0yf588kLdIIVvmggmUC29bYAX8yaL79B6pcxiu
	JhCZOI18nvh+9zm8TzzTMWweqD1v2Qq3wRojQlGk4/jLCcQkEmXZ0qDqK7CC5JzdiOX/xD9oHxP
	mvUCDHeQzObLTP8kgMq0Uxjt+YKsehSRIiMWIGZZP0AaWAlZjr1NNhDVYLTYXsMOatV61SDuxZe
	Id/65VkVjtwkJI/M2Qda12i9enpyIegnA5gw54w3PmRH9CMEURQZWNHkJ7jv/F3UwkSh3GeYE8W
	MHH0WeNvBveTbSOzDKsfDKBBFybgA5X4NsZKd+fhE1IbmFrgE1tToMe9MWr1SfZnkkrA=
X-Received: by 2002:ac8:570d:0:b0:530:db17:b1b1 with SMTP id
 d75a77b69052e-5310cf168e7mr26629401cf.8.1789382472521; Mon, 14 Sep 2026
 03:41:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914090408.1435080-1-inbal.lipshtat@mail.huji.ac.il> <20260914090408.1435080-3-inbal.lipshtat@mail.huji.ac.il>
In-Reply-To: <20260914090408.1435080-3-inbal.lipshtat@mail.huji.ac.il>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 14 Sep 2026 03:41:01 -0700
X-Gm-Features: AcwNN1V9iDmM7PzpMeqDOMBzojVOrcgi4pfkAfg8icBKj7kbHhaBUk5wYJMY8oU
Message-ID: <CANn89iLQdNwzFw9UXNmTiGQ1ge_etUJWz2npXk32Hg2CA+zgyA@mail.gmail.com>
Subject: Re: [PATCH net v3 2/2] selftests: net: packetdrill: test exclusion of
 old ACK from TCP fast path
To: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, amit.klein@mail.huji.ac.il
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 2:04=E2=80=AFAM Inbal Schussheim
<inbal.lipshtat@mail.huji.ac.il> wrote:
>
> Add a packetdrill test for an in-sequence data segment carrying an
> excessively old ACK.
>
> Verify that the segment falls through from the TCP fast path to the slow
> path, where the existing ACK validation rejects it and sends a challenge
> ACK. The payload is not accepted and RCV.NXT remains unchanged.
>
> Based on the reproducer from Commit 3d501dd326fb
> ("tcp: do not accept ACK of bytes we never sent").
>
> Signed-off-by: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>

Reviewed-by: Eric Dumazet <edumazet@google.com>
