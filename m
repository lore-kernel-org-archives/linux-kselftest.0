Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C0E3126D9
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 18:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782413606; cv=none; b=htemQlLohu+YrOxY/HKivAHwGevDzSEheUy+HRtrNuSbS0J5524pZ3yZ9X06uZlCIQVXgURFfOjWBI+lyvWU+Amo5h7lyQzeVSZwOZ6t+C8GgBezU+iaWVTOCaqZ1dd4aIDS42rl1O4cKDV9ATrKQaUQ2cCLK8nkRfEEMsQKBNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782413606; c=relaxed/simple;
	bh=jX4tjDS2TY1o65mCKlxOrdJcyr8jfpPpm95ymgwH6o8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A+9TD1jxEFJpdvkTt4x35wRyqSyruLBKAbpjd/knsG4sQ+MICGfdq6sTmP1uLAPn/2VcEQVbaFWczWAhfQEX5W2D9c6kstHPEmtblPDP+MO+jv8hNnL7pm6AT/BChD1skrZ1PM3EAslbvip91d2jOeTmGjaLeGVAyZ7vvK6q/po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qKttOaDz; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qKttOaDz"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c6c57c5bcfso3028355ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 11:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782413604; x=1783018404; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jX4tjDS2TY1o65mCKlxOrdJcyr8jfpPpm95ymgwH6o8=;
        b=qKttOaDzk25+CQnub6y7OvKXKEiCA8KpzD5HHFUpOh+DkktHoDXcKeO679lN4e5ehS
         B7b2MH0CamvYW4ojDQrlQaOSWl8U8ih13XYhEZmik7ug8GYommbP2qfuoGDoTQs9uhrF
         bykBr0ryFYT8u5/O9zavDNxh9D8LP1jc7JEja1eWBszdGDuC4Jtzi3kjc6yR3ioAA1Q1
         e3lMIzOXEfAUnaNkEanbuf5fPK7tZIisI2dtWFW2b6RlPk4m4nb+TYGBH7KHPHXsBFjQ
         ZaM9wFzi2V/i3MrpPb0lQ4nO+7mrqNCHqZAVEHEq0Fb9LRI1Vg4cmnoQIp2kgsiOuOy9
         /G2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782413604; x=1783018404;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jX4tjDS2TY1o65mCKlxOrdJcyr8jfpPpm95ymgwH6o8=;
        b=k81vx0lP92bXzfnnqz/BtBNV4Wm6rrqPzdhsN5WuMKf6zZsISv40zVzJjX7vjSmI32
         90FtIGD7tuPXFF66EVycjRTwwGVwI3uf8UQfNmVJq44UTSzeFS4pKwG92mLqU5Zj1btO
         qONOuYRi3w5UlZVRqEE7zWM23UUDXVOnElMAtje6qBh9ZwNJeoZbnwmiuKa2/NxtahNm
         fcMQoc2a5NxyNztUc7c4t5mNcKbZDEHnR3q49Txfl0VXzH7T2FgLtzCXWb15sr3J1AVR
         6aOyIJMPs4kLzncXcqAzcV6iFRYEYbdBHKrebHvIBR7xpFZ/VBEjGu8Xbp6sH3TiS2jR
         kxWA==
X-Forwarded-Encrypted: i=1; AHgh+RqsiJaUdgJF7gzTl66NqtaMMn6ZVt0P010JtkB8DvqLWYM2MYidLhDf14qNfBFA+1E9bONCI3SV2XWAWTr9l1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIaPDcSreZLcO+TE2Bv3Hm6BpVAolblLU7z7zvTm/IX+f7dWep
	w2dgn+a8vkXzYory6SyYj3i3uIAv1wqTtyLO03obCJ6QPwRgyxPqHdRI
X-Gm-Gg: AfdE7cl0wuEnCCHcrjDj+Ri/C6DCw7tT0KbRq8wv0yGN0+uJmO8ZaKX338ZLAnmQ0kx
	FOCPlMozqNh9BP2Jw9MstMdhottxZ2iDwj3myJM6vjdPbvPCk6jESTZtD+RyBJRGYoKHst0TSan
	hF1ujr2DREa/SNrvVjQltkwG9DUSEatLzxQaSkS7wvHvOzYo9as8MKSLfcIZNt4X9px8+ji76hy
	/+eiAE4h+1Yv3rLDFMplYTwFYNC/7cCXv9s1i9ZKW3biOjVD4Xu66GWurP9+yMaLpVIPEGncVJ/
	2+rdWtzPTC9r9rddJKDW/hqf34FM52l8XBsRJgFaphYeZ0gmsjRoz3S6t1Y0byaLw7FmJDGm9TP
	dKAR5lGUzowxbxUzzdakmjdiOnluO6O6HgxBMWLZnDHAHc5oXWL0Rh+vSj15ypBYQGzqKHHMt4A
	w+3hTt+nwp6Cksfeco2UwlOkkPvt4lkyUh+bGA3IAYjKA0/D9HEz/0
X-Received: by 2002:a17:902:c40e:b0:2bf:281c:d2d3 with SMTP id d9443c01a7336-2c7fc7300c6mr39782095ad.9.1782413604402;
        Thu, 25 Jun 2026 11:53:24 -0700 (PDT)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d09f0sm26396125ad.56.2026.06.25.11.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 11:53:24 -0700 (PDT)
Message-ID: <01858c50447df77199abbe570d3ce06288200721.camel@gmail.com>
Subject: Re: [PATCH bpf 1/2] bpf: Avoid eliding lookup NULLness for inner
 map templates
From: Eduard Zingerman <eddyz87@gmail.com>
To: Sun Jian <sun.jian.kdev@gmail.com>, bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	ast@kernel.org, daniel@iogearbox.net, john.fastabend@gmail.com,
 andrii@kernel.org, 	martin.lau@linux.dev, memxor@gmail.com,
 song@kernel.org, yonghong.song@linux.dev, 	jolsa@kernel.org,
 shuah@kernel.org, dxu@dxuuu.xyz
Date: Thu, 25 Jun 2026 11:53:13 -0700
In-Reply-To: <20260624072031.735846-1-sun.jian.kdev@gmail.com>
References: <20260624072031.735846-1-sun.jian.kdev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-06-24 at 15:20 +0800, Sun Jian wrote:
> Commit d2102f2f5d75 ("bpf: verifier: Support eliding map lookup
> nullness") allowed the verifier to elide NULLness of
> bpf_map_lookup_elem() for array maps when the key is statically known to
> be within max_entries.
>=20
> This is not valid for array maps used as inner map templates. For such
> maps, the template's max_entries is not necessarily the same as the
> max_entries of the concrete inner map used at runtime. As a result, a
> key that is within the template's max_entries can still be out of range
> for the concrete inner map, and the lookup may return NULL.
>=20
> Do not elide lookup NULLness for array maps used as inner map templates.
>=20
> Fixes: d2102f2f5d75 ("bpf: verifier: Support eliding map lookup nullness"=
)
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---

This was already fixed by commit:
53040a81ae57 ("bpf: Keep dynamic inner array lookups nullable")
Please do not send stale patches.

[...]
