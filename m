Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293D6425CE6
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Feb 2026 17:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770400523; cv=pass; b=fQqFlFQGp+LDnR3m4bp34DGnxNDOmYsVyvK/wdR27FYl9cAKHUm7wnwPpgJEaTkphzZrjVSo9p3+uT8f7xIOvotW/B17jAXgGc/JnpwUMfTnrlpOYtfwpFuyNFdYk1pVFe0kWuNLrKOjZSkJhwyCCc9iNzZVdYPBVDKyMN34EFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770400523; c=relaxed/simple;
	bh=CQs3qizMq3SbCY1dailXM4UPmWUUNs7Uy0jKl1/hvIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o2eaZnux3GtkIgOwCT46oQehkq6rYvdZNmAYzWS33dhYhn4U4LL2LYQQfqvNstDFDjnQI6ZsNcTvycmdylZMnCwU0mcIry11NEUT69YOQqf1nqyu8DcSmCN1lwvLuOACTzBFkAwxxToxvOFPkY79RoX93YbIAkugfgC1vn//qvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iVLADzda; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iVLADzda"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-385bdc72422so21347871fa.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Feb 2026 09:55:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770400521; cv=none;
        d=google.com; s=arc-20240605;
        b=Qf1P8ui5FkV9B3iXyOAYIGAvg1npKHq8OA4DBIi95UkhPZF7BJlSsgDF1APB63yCI7
         KE0qnpdEGKD9UXUHUC+wFU9TOStfAOWrkh293SUhGiUMHhc6LfwhoxuupeamS44AZvgW
         vedWSFjEvF5+TjgX9nbKYzb1DBkeXdSgNSIJABK0pCOWuuPc6M1nxzgdZVCMI1FWMcZ4
         P5IOGOihHbWHgVLHGVXC19YzHlcOCEHPWws99005SHuthEWQBmpWcFuVGWTAoY0rx7vu
         sCnD7n2jOwcnAQrUYKUZ5euGLn/COsdkoCod7GWXjt8ow2kvAA/fT8yU5DyWzlSNkpyG
         2lbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CQs3qizMq3SbCY1dailXM4UPmWUUNs7Uy0jKl1/hvIo=;
        fh=XkZ18o7l1uWKHqomuxoJCI8/5rgX8t1vpOg3dNGOzrQ=;
        b=dDc1kHtojx7spfCE613mSA69KT8LHI8aPwHKMmZljS1w8IMUJBGN3btTl4ZVm5p2T7
         NuQodXAXDod2c2uRRHdtzcMRctvNtFw85dBj4TLbEoCT2zbCVNDxv5D4Wq29Xds0ccT5
         kxGYT4wjUsFtG+SCemVsAqPcEc3QQNeX/mlJKwS8EdCuSco5OzFZ8Y39SX2YfY0rnwd1
         yXjoCFa21OFXT4vqj/MWPz3CapTfirhI3EVOE8ucfm/CYkFYw9cTHL3dQCOHVXd9lOLH
         A39DWScgcWObNsNMI4QPoUbT7aebre3I6c7lEE6NFGsjdBI4TKdLbjwFXUDq+aVesx5R
         hsjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770400521; x=1771005321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQs3qizMq3SbCY1dailXM4UPmWUUNs7Uy0jKl1/hvIo=;
        b=iVLADzdaD0oZa1faECWjz9DDhEdD8N/CZtDRQmCRjyq+v/tmY/6t8TBnKMk4Hs+f7o
         sBhu5gyJ45rStzKgG9x5fZaTkrUHsG14eVzumxPifC3vBhWYI+piGkbszSZM093uBf6h
         m/irnSf2zWxu3anoBPyNa3Ia/DOLmcq8EqYCHnvvWqMIMbLFZ9g4cY8l4bVKqKgK6g+p
         DUY6R6iL4oDMQtt6Du+PRzC6zEZrKU07GxY74q6iJSdv+Mpnq/etpygMIaldSuMZlu9f
         3GOoFxqATHibKat3Yz0mL5dQ0GWnHVwvh908krQWtSLi8yfD/qmvM4u5S/Z9KWSY7VZw
         HXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770400521; x=1771005321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CQs3qizMq3SbCY1dailXM4UPmWUUNs7Uy0jKl1/hvIo=;
        b=UyqJRAhV47pzftob/jBju9tJ8Q1/g0EQMViza0fvCCmIiIF/aEIkCI3+Jv0kMS8x1A
         uApVvCVxfGODoLh8aayhKH3S5Bf02MpxmkZDihSXnv6X/fwFzYpaTGMLUwCzYvlIU+N/
         nKEk1K5iHc7+Mf6/036sto0hs5Jc8cvOlu69pBKgvxN++PkwCO1s496MvYk/v/rYm6ZF
         gn2gm9M4QuxqbSWGFaZZQhymgJa1nOYdRti4WfXo8kQBVGJZzopsAjAOflMIgibmaKcX
         nBpvS4p9MgVw83fegz0xjNey9JXK+fUGWJKGa2YiIAcYyYmCstFY7sNH5d0v8yblQOWK
         5GkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUz4bRqQ8N0pz6z6x21i9p03tYEczxpaFkfccdVzfa5RaeXpPN87aKQWOe/A8lhaYrETv9qnbtJcVXTMyUJDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsHum+iUVMRr0XpZcyWAaixFCnnIo/0OKlk0FlI/WRfmxEif+i
	nZZaNdDEIgHErxkXJlIw3E9jrLq1rtJJy9vNzs/YY5YLoSWmPLdFTXca9UNhlodukgrV7vRvw4J
	nuuVwG0Ah2ruyimkMqHbTY3u33GN17PRG3m3+sYsY
X-Gm-Gg: AZuq6aJPhpaSBmAWpHjpItU3wNoOk5b6IT2CoXG4CJBZf/zZExDi2bFvuBlYkk4XD2W
	oYvXt1JxBGGidWnkulgXei8nnypaowKBxghrS7HfxmiIW8t55/vdEKgv6alSe9/ipefGuHkc7CC
	s28mRFbyDE1qNGF5dfCIs4NVtqK6jSZeOwfRCaUJHHSvAjwVwDbl/JiicqU9Pi74lQTFYJYNY2F
	62Z9hl1LUdNp/cNXRXxFtwgmmhyyG3NZtmaNWiNet6yIsBMj66vjrArUlXc87BLPtKFXg8=
X-Received: by 2002:a2e:bc84:0:b0:385:f2fb:14db with SMTP id
 38308e7fff4ca-386b513b416mr17372541fa.36.1770400521052; Fri, 06 Feb 2026
 09:55:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202-vfio-selftest-only-64bit-v2-1-9c3ebb37f0f4@fb.com>
In-Reply-To: <20260202-vfio-selftest-only-64bit-v2-1-9c3ebb37f0f4@fb.com>
From: David Matlack <dmatlack@google.com>
Date: Fri, 6 Feb 2026 09:54:52 -0800
X-Gm-Features: AZwV_QgTrk3DAg7DGpaF40s0Bjc0dzuDlKfmgb-NfhnAhfOJ4GnGSp8CJdyHMsI
Message-ID: <CALzav=d3Yd_v8WJHkhB==22hsbrroNZguk=2ssT==AVBzxkN0w@mail.gmail.com>
Subject: Re: [PATCH v2] vfio: selftests: only build tests on arm64 and x86_64
To: Ted Logan <tedlogan@fb.com>
Cc: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 5:24=E2=80=AFPM Ted Logan <tedlogan@fb.com> wrote:
>
> Only build vfio self-tests on arm64 and x86_64; these are the only
> architectures where the vfio self-tests are run. Addresses compiler
> warnings for format and conversions on i386.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601211830.aBEjmEFD-lkp@i=
ntel.com/
> Signed-off-by: Ted Logan <tedlogan@fb.com>

Reviewed-by: David Matlack <dmatlack@google.com>
