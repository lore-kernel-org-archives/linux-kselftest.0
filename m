Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC4F31F9BE
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 07:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781855189; cv=pass; b=R0UaMH7SV1CYHcDswYvyBOeXQchFWa40/9bF9WCmLdstUboNYjhFgew7m19MERMvlYfMTu7Ujto2XiTBH5jG9rQlyp4Q5jOZBDFKJxiXyR0SH5Ec9Hk9XRKNSdQ3PzMTKCrVHFZM8CJD5iwybkSKV/OQqAU5jfdQLizpKvRrCbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781855189; c=relaxed/simple;
	bh=aCRTd9jlyyJd4Xfqt/Ww1AC6ceC5ZfvAZhKiebLSRp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y4g/NlKIsOxSLRallw7SxVYKEFJrE9bP3FV8YaRiGUImyk8KBoU9c8BlONQ50cgoR87x4hGXZaRuNXSt5M9Lob3Xt2IZ35QkluA6rm0sfcZ6jmLbyeMYErQlMkjCJB4V0KV+Te9wfxhaUAdkD5mXl1e2FdNkoinCTamxQgYoKqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1fBoMep; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1fBoMep"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30bc0b90dd2so175803eec.2
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 00:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781855187; cv=none;
        d=google.com; s=arc-20240605;
        b=PMZutOFz3SuQSrg+x8zqx19lmEBPpF3bCij1czpsRy0wv5RNPQg4SI2rOcpiYtk2YL
         wueNrGNdZz1FA50nc06t8aTXV6W24D0s/pV13JnHBMEPodkZSogc2s8kj9XSAWmZsHS3
         jnmrURzS4j90pG/zWFCPu2AoUPEWeJujTZeeScRZHK+EqkxbUBNyiz0Durjz2rnEQByz
         11ox+O2qwyv1AJkUxelo+S1RcO3qAV3hN5JjPwsQXQS/7l+UNzKjKZlFPgvma3/7NSHb
         73XsJDo/4R+tIgt74252rotpHfF+EYdSXRgcNHNcjGuwU+jjwTvM7PCXK0y8fM0fmdpJ
         LavA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/0Q+cvUfcBxjnvzmikgZmLYPhLHEmMy80/ozDiYHARI=;
        fh=+pZqeV9VgQQEbd1VKeCt8ZQh9Xeoa6kilzmrWztplwY=;
        b=Id+R229PAdMU0nFApx08EmxjBLlGFUrQ51pY0t9e52GM8/CmTgOHMC/G0e5WLT6xEj
         qKTcFFQiYzAPhPDo9v7/ukqJt//nQVQYwTeNVTc06QGZT3zN/td9u7WooKYFM88IyF4X
         tEqr+Ba9MN4iUdZoTsK+kwRkpxQsM6+0gEfBCoVXtP3QrghZ9N/IaxTlp9kGdsPDTcSN
         OulXA2alkh8JHahtN6fPSFW5dq3A23GB9xHdbi8LhwJISU9pj/cuSJ960L+1R9Nv03O/
         GP2LyO2+KbUO34P6ff3boPuOgJlHWWuY9kITObCQ9N9wxaJg4ClK9/IWnMtgEl3+2+Xv
         0R5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781855187; x=1782459987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0Q+cvUfcBxjnvzmikgZmLYPhLHEmMy80/ozDiYHARI=;
        b=P1fBoMepkq68ZzAPBBrP2yGbWOV7ypBuhtfPqXKrEhx0NZgiIV65+uevjb0qP98slL
         fYrHjwkLSSoK/DCEcjUXSRdwMxXeAbSPPta8qIvezS4IDwh7CpuU328XPz1od/NqDMRd
         uz2qWvIYGu2vxiZl2iRCnxg41c0+7LfUd9uegm9Ec8onLcMmB1qBgub9LEYGxZ6Wju2P
         flHU8dcgycansxRJlEWeMRi/ZYoyRLdOYXVMY84rUtkVDSkGxg2j3V1YznqIFMPdNYxO
         gSmZSXemA3k8XjHHsGrZJvKFg6pCwPQbAtJRtssbidSsEp4/BZ+VHGio3dRP2rvi9jdT
         j/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781855187; x=1782459987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/0Q+cvUfcBxjnvzmikgZmLYPhLHEmMy80/ozDiYHARI=;
        b=eh+c3LlUvl5my0MxzBISMtwgvscBdQooNdAhzmthACVGR4hciFxxZn2loSuPyo7lhu
         tJVfKbbHcQZplA2bgxYDGQhPIIszK0ePjWPL8ENKxvJG79VOFF641g5HH2G7AYUkmFQJ
         iDYqJInQkGp0V/pTN9TndR8VUQ9gEDvn8WVA3oRqyA1sLCcYVF52mWEvuhvwHipNbyaF
         dybFS5tdsy1Ufy9Fg1QBnoIRcnEAyrhoWySNyvY5FSxrFxi4aIbGcRe2cSWNvN7LH2OT
         tX7KcguST59U19sMEu+6CzMLvJ3tqCpetI4B6E0ak3nrOo2KEe6drVpPnY/uycXm6B3E
         Qi+g==
X-Forwarded-Encrypted: i=1; AFNElJ/TwpeNsp89b5B1Dpmuj8m2PhQGyWR3gPQdZmW5mnmuP4s/zdqPCTySgY0Mmkkj30KzdTCXtqgxtWk7pdjKOMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YysI1i/RXq6R3a69IMaHllEk3Arwu+D3c5h3NeuEuHaZEeuXDnu
	EpIGIyYUyLVP30pjZ3Ul2WyV4cAiNFmifQNLDpmiuAu89d06wWzUxiCRsOp3WPM01b0tNMYXj5f
	q4GFwCKqx5EC3M1WGy3wPDuTJ97D85vQ=
X-Gm-Gg: AfdE7cnrttePXOt7q1KymGq5HTZExnjv/ME7/9R/qAW0m7228RclPVZZgWANgK0py/U
	XcU2Z8+XULju5isartiZcJIPDuVy1HAlxBS/fLeiBQOTxf/ttfddpD39GNG7y7w0kO6nY/H/7Av
	JGf0doIDRjA6VmaiDUU1v6312bYYoyH3zlub1PVVvBb1jKUDmZfyamOHIf0TIpFsSQsp2h0IaqI
	fw6lvW4GRNBJ4Hdz+zWJEOoINgWg5DUczDF/isuhSDMufImF9aQSWweGjPbEUNkVbvU9HEmk12+
	V/i/iBUV7a50+JwFR17i8aM02MGE1NupgkYDz7RIEhZNChyrg0jj9Hgclv/LZgg8kuNSn4sBYTh
	zu1KnlFa58z7j
X-Received: by 2002:a05:7301:38a4:b0:2d5:9438:2a02 with SMTP id
 5a478bee46e88-30c06fea5aamr875495eec.1.1781855187239; Fri, 19 Jun 2026
 00:46:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616132559.2245814-1-gary@kernel.org> <CANiq72n-QC-DGUX1Cng0FTDbDM11t9N+6rUC4QxxBQtL9ntwMg@mail.gmail.com>
In-Reply-To: <CANiq72n-QC-DGUX1Cng0FTDbDM11t9N+6rUC4QxxBQtL9ntwMg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 19 Jun 2026 09:46:14 +0200
X-Gm-Features: AVVi8CdZmh8TXI9AU_ds1F4ehLYLgNNFHGOZvy1KvZNuzh1wq5A-KTs8sj59tBM
Message-ID: <CANiq72=tXTSfG_+mkpAPsXZf=_S163XiEkE9FfO9rZBFWu+qrQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: doctest: fix incorrect pattern in replacement
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Igor Korotin <igor.korotin@linux.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2026 at 9:35=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
>     [ Improved comments for consistency. Reworded to drop changelog and t=
o
>       fix typo. - Miguel ]

Actually, I just added a link to the comment to the upstream `rustdoc`
PR for context.

Cheers,
Miguel
