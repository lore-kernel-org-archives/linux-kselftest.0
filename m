Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB1B3DBD5B
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 03:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776916674; cv=none; b=ouRAFy90y9dKfREtL+3S4nHd7JHahmes2WC19AljMy7K5FMlBOY5HJS0bPvVIJfj59MTgYwp3KiFDnXpwu1bv8fENWC6mIM8WOFIsasFUto5fe9fbfnzgBZgnfmA+5YheG0Gt9tbz5L5e3nNrkltowVI++3osBHj2sORDp8o1z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776916674; c=relaxed/simple;
	bh=sP8VwTVibgFh2Sp26u4FZsd/tmJ1zb+xee4pxb/MRMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GAmR/Fy/bAKMAWjkhoxU28E0aLI1PLX2Vc5Z6kPzDY/oyzyCYYessySgYVJh1e9Kbh+UQC6cQHv53x3KNz3ecv3+jyM87yKie4IMAHLKiG+qjzxrtRmfOUZ3Jy4ONdPw/VGAcE4pmzBj4Osx10m9WpuXydPOaZzrN0M8+GqlOKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXg2Bhtg; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXg2Bhtg"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso41416925e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 20:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776916670; x=1777521470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MbrL1XZZhefhQUaVu+cW2ak3PDj8qOb0MiC1YKHdwbI=;
        b=bXg2BhtgkslZZLbmpnqmOl5evT5/Gy/gADyyVP07Wx1KQ+KiTke1xFJirkSfBL+4vR
         1HQigetdSFw8LK6JSEUx7anct7v81njKAjTW876p+yDE8HBFq1niU/AEU6hbZUx9hlRR
         KTAX+NnIvDlMK55qOr5M4EZ7IBU4L5+gbWP1dIOIahNb2nPbIsztgQmK8snnnw5kMWII
         15K83LafEC79lyCjPRYY7Wy71z4HFw9tB8pe+j8dbwrQO5t/iwjWPYLG1yXdbPNiUB5J
         ++sHg2Hys+tDMp+sABQbyCUWkQZb7qPKZrbrXKHN7nUz/0kxblihcv5TeFQg2vz9+Va5
         toww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776916670; x=1777521470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MbrL1XZZhefhQUaVu+cW2ak3PDj8qOb0MiC1YKHdwbI=;
        b=YNKxTbK1gM+x8pPisYpziqnsxG8H2X4h3Z5u5i6Qx9RF4N10oJKfskui+SVoz+tTAm
         HODhdjufUK1pPJ4s2xe7jcCmTSThCDVIMsDeuu2NZrFdLbvfeQrbFOUC6NIuDMwgWTEL
         IH0nZ6jkVj7BsTTvVUuQbuUzzOMzWMwJE+VSMwZcXv/sM0lCLw4knFIi7i1/sP5HPL6o
         yO3x2yrX7hCklDhS4M4Ai/8kh8IjCYLZVpRTyYiS6Xzc+mkQ74C103TZ9HhDrQy4588g
         lrJueiqV4yo0Y55h4qq7zAN6a6m3A1ObzqZ13UBRifHImB7MElZ+O/CtdUQDyL78ao61
         71Qw==
X-Forwarded-Encrypted: i=1; AFNElJ/3FES1dCHLQ8e66Lk9HZTrRCE/n/pn+2+GF9ICjVYA5DgkgOUeW2GMj1VR8g+wWUG55/N5fcBcMqXR2CpkW3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF8ALxXy8dhbFMCfPwEOldZ4QNV5mNmwCcR8E3O8r3KQrlOSIX
	al5eOVIQml8KXjvfCy9lPTqGx+WJsFa0SSmOyCOCFiT/3BTBviUgKepE
X-Gm-Gg: AeBDieuwsGnJqj8emhJJJmKJCdtdnVp0Dzuqy4TqAjb29hNHA9AKBNUCKGAXXUaiicJ
	GZVvVAyyg/kuAZWmpOsn0bLq3ItKT55oki4HTzcTvznAlG3jaWzKAdcoTZpybtEkyEZwEdMo+lE
	PhdW2yx+T3sbeS8kMkDMpnreCBCboLw3WiO9k0tCUGYXiJl0IPZlnUCLadSCJh/XFxMBSNZNGSv
	wmiqi85M6UBAgEG+jzEUbVdTltIiImbTJzgM07ncqXjPu+qh81607tDJHJALN1+lrLUebIOD7iL
	I5H+to1hVDMD8esN47M7c8zbKZshnJPwppR5dmWh1vP+S2i/KhAyAiwvLcVdwtfupYDnYBNm/fF
	Mwt+v3gVD/9JDLHQX7PtIMqdw1j9JGwsgO+3BS97INNSMmAykzP7tSghwfh02yTKt82PsbC88+O
	qIQ+YWEt3EvuNEuZzCyFydVSuT3w1uV9QvbNpJuHH8E/4NBfe+73PuKg0MQusex5zvylGz7dgcp
	9h9GjAg6yTUhs46hjg=
X-Received: by 2002:a05:600d:8451:b0:48a:599a:36fe with SMTP id 5b1f17b1804b1-48a599a4413mr69411735e9.24.1776916670290;
        Wed, 22 Apr 2026 20:57:50 -0700 (PDT)
Received: from fedora (185-147-214-8.mad.as62651.net. [185.147.214.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm836912545e9.3.2026.04.22.20.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 20:57:49 -0700 (PDT)
Date: Thu, 23 Apr 2026 11:57:44 +0800
From: Ming Lei <tom.leiming@gmail.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 3/3] selftests: ublk: add ublk auto integrity test
Message-ID: <aemYuKH5wlOFhMX8@fedora>
References: <20260421200901.1528842-1-csander@purestorage.com>
 <20260421200901.1528842-4-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421200901.1528842-4-csander@purestorage.com>

On Tue, Apr 21, 2026 at 02:09:01PM -0600, Caleb Sander Mateos wrote:
> The end-to-end integrity ublk selftest test_integrity_02 requires a
> relatively recent fio version to support I/O with integrity buffers. Add
> a version test_integrity_03 that uses the block layer's auto integrity
> path instead. The auto integrity code doesn't check the application tag,
> and doesn't indicate the bad guard/ref tag (just returns EILSEQ). But
> it's a good smoke-test of the ublk integrity code and provides coverage
> of the auto integrity path as well.
> 
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
Ming
