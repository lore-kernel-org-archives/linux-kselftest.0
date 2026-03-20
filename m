Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447A53CBE6D
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 15:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774021170; cv=pass; b=C5k9JIZnvTC0N60lalFKpK03qdXWdXEtmJy2j1FQxC4glfytd7ZDIn14FYbgFDV4Omw+6muxGhX90Ufb1C6bT7rnEY4sxUZv4fY7BwnGV+09RcJfiNGTuMbOg8wLEIrWlH8f7WaoKD1huxpGG5h7MhU703uXfIHzk6WaI2yYOOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774021170; c=relaxed/simple;
	bh=chgcSRYsj8N0hiOmzDKpGUiSVwJE625pHCuXPV8ofCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YFIqF1VC+tndV2pU0uzo0wemqFKQ08VBhqQPl+gLQ6wYDEOifLdLJa1yHeQwmZi1lL6L2pBwHcZCw0mky9chFgPANtWAvlVwofKeYr2+QcQpcW26XNxKzbsGhRKuQaUQJ9J3o3LGj1NCEdeHNsPTidrKan6FRuJDHPIupwz/5Lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KT17nNjN; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KT17nNjN"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a1443780c4so2718490e87.0
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 08:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774021164; cv=none;
        d=google.com; s=arc-20240605;
        b=UvW/blRypkg25OF8j+vpGbM/QN/HFlPRMvxjzzaI1kdXpgygN+0nBUZgt5xtWFuZ4L
         g9Zp3sy5NZ8HG3Dk5gx0H/LZJnVcbBJEhWpnEi7kQELtam2re3yGMsTTAwKEPTrdalCy
         Lc1qRyhtTjQ0v6QeyGq8fZYJxiMwOyt+qXPY6wlz3JXAqZ9misbbWy5kLDzTCQGNZ1j2
         wufZRHk6jjcvl3pQO9lnprmYUuWOaUJ2F5uAroJOsNbeOB4ikvdWgdUFY5E/jSvpjIeF
         0mBIqpmfhmnO1aIrOL47RoDrLyyIPNugz+o71ak/CMhu7dP+ZnPNibJj/VeYtrObdFah
         x6Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6tEASViCDgGpPWmKGrjem3hVHYFcIgQS0LV4EwIiBtQ=;
        fh=f4oE39t6bsWVftgh2QypysyejLxpbUcdDTP38nIkAGk=;
        b=d3BCKlOzlCyJdn34ic2G6ZbVxvvUCYFcG/eX0mkrDRysCwDkpTMB84sOviaOpyO2zk
         p0wIyQz1cKaoVUTV+HrRWO92AuPqzk8iREiVFe4/kr8K1Oy/r/54oeAYF4NemBE9rK+P
         cVUnR0lnhhcVFjhyBkLOmRq0Bwn6rIQMcKG4WSWgSgQDnB2WL82Jj5ehpvV9r5SDgia2
         oF++YQADwIDLLJxtCRDpZIHkAA2QDkDRJWq84GGlzCrtHPHtYcXPG+CZ7+3NHwy2qJMo
         0qRvGRr3/2+7jPd/zWa8GH0JYt8rMxv6E9cHajj6eMrGhKbQsxA7VGHpR8mpizfzhqRn
         MwJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774021164; x=1774625964; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tEASViCDgGpPWmKGrjem3hVHYFcIgQS0LV4EwIiBtQ=;
        b=KT17nNjNbQH9As/b1rcGZU0hvGHHPJ4zAJU7YYSPUNa0RlDI14t4ZqxzU8zewx7AOX
         EgDIarBi4mgzsDmUEelnbVj3ZeBdo452r4fzuDu3jvdyyncFSHGDv8DhDAqemTONu4pY
         Hxmsiu1Vmc9C132zvK1aQGUeS7SF4xCDc44aBSs2/CggZNj0wSCjklBk+Swy2UovHtBp
         Vf3kkgSddcpEykwLyi8T3bcxT6XRHgSYp280sveDep6Rc1Y8Q+Rtp/YsMqetv9dXXg2r
         rBshjwefDZCbg3ISKoO0unXyPLDykWp+6e0HBvgWszwsNfCD9A4CisznFP7ZtMvVmQL/
         6/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774021164; x=1774625964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6tEASViCDgGpPWmKGrjem3hVHYFcIgQS0LV4EwIiBtQ=;
        b=LhNuFlXIJ6gEwGKeJ9g8lbMkYznS9QjsJePZRIqVe51Hmw4Vv1madyuQ5LrEfLnk5w
         U1Bg7i6acJ86Cq+m2a2cvqoL2FNMz2fHiMjL/hvTJAc9fLKx+4gYXKVxihnZxqkFaRD/
         yPJKHh2/rYNbQJGUJoakEdPh5FzsgTnqmKUIStzfeoi5JaNinGP9PZ3AcsCZRH4EK7j7
         PEevvLsJwobEuMgZxTvAIAz4+Um7T0lwWtAxfzEpZQyi+9tEAgw+N71Btl40aN7/OX4a
         ENtuEBdvm+dl+2ZqIiDW4bKR+9U3CG1EBBSz+SexjUmlVFsCoQtZsaAVvax8RU0jBasP
         t3nQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3EkWk5aaub0oaT9Z+rWEEm3ZtIHNWhjMf46+La/PZkxwB8y5W9ozJ/xRyYDD47n31cUkxwJp8A7RjUP9ycwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPQkPvqAnSqsh33DQsTlex1gFlWhe+W7EJfM2gn2bbH7ODkJ7R
	vsLQ0G1EnpGocxhxj6DEAjjnITievRwRziqu81iP3KVuH8L5WByRke0QqHbNW6YR4+35wXNYpKU
	a2OsZJo7CjhhxCXSRUgKPx6waZ71Rz64PazAfcfQm
X-Gm-Gg: ATEYQzycvZKaOGjVYIpmIFalrUmZyW78CXPO18XaUj9s2eH6pbJANIGv2nqpEbQzAC8
	5S6oXcrsLouV5RnnvbV1aujO28Yy7rO+fbtgzHbFY4CzoU/dimG9NCAg5BoSfNhuzPEuZ9OyIrU
	T4EXk+p6BtW10KGWdxApMz3+3qi7x1zmf2TqtGnGB4GbXc1b72Q7PujbtBx1d+5jAOP/Cw0Am48
	njGSpnErVBR91aAPMMRmavLjB9BgHF0O+xlRNBEOcahUO5T7lcu3uB130TvPMIQv8cpQFXDe9Nh
	QL/9VuCv
X-Received: by 2002:ac2:4c52:0:b0:5a1:42ae:88b6 with SMTP id
 2adb3069b0e04-5a27de4f200mr2823773e87.18.1774021163672; Fri, 20 Mar 2026
 08:39:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320010930.481380-1-yi1.lai@intel.com>
In-Reply-To: <20260320010930.481380-1-yi1.lai@intel.com>
From: David Matlack <dmatlack@google.com>
Date: Fri, 20 Mar 2026 08:38:54 -0700
X-Gm-Features: AaiRm53xAk-g3r9wQepDcgKbYKM9wGMEW73jp11NhHmcueWyQ_iS-zO8WHJC7NU
Message-ID: <CALzav=fb8Tgv92FMv-yi5q9xesbBy4_tEq+Vyyypm4MVJ6YfHA@mail.gmail.com>
Subject: Re: [PATCH v2] vfio: selftests: Support DMR and GNR-D DSA devices
To: Yi Lai <yi1.lai@intel.com>
Cc: Shuah Khan <shuah@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, Alex Mastro <amastro@fb.com>, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 6:09=E2=80=AFPM Yi Lai <yi1.lai@intel.com> wrote:
>
> Currently, the VFIO DSA driver test only supports the SPR DSA device ID.
> Attempting to run the test on newer platforms like DMR or GNR-D results
> in a "No driver found" error, causing the test to be skipped.
>
> Refactor dsa_probe() to use a switch statement for checking device IDs.
> This improves maintainability and makes it easier to add new device IDs
> in the future.
>
> Add the following DSA device IDs to the supported list:
> PCI_DEVICE_ID_INTEL_DSA_DMR  (0x1212)
> PCI_DEVICE_ID_INTEL_DSA_GNRD (0x11fb)
>
> Signed-off-by: Yi Lai <yi1.lai@intel.com>

Reviewed-by: David Matlack <dmatlack@google.com>
