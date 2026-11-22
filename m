Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795357830;
	b=obT+//OAiFMaLBw/pdF4YqQOLJ0ScvZILUwVC9xBoQlvvXqh0C91RqxG6/nh5Yc5nSaD
	 pTlqt4M84u7FfABla4TDuKGYfw1VFYy61Ds0HzF3HMgBbhFuI0rgsl3AD0tzk6SPbhApo
	 C4N8bOLIwruD59smqYcfmX3Np1J5cnv0RoSLqNWouTsOhImvZN84wV4DzsmHamqzOlYCr
	 buq5Cl+ScS2x85jvVdg0iHIeYo62Tb7tuvIlADJPLy5WGEiPMtrmga/cEmmogNCwLiOii
	 8ViArR1FH9Q+QMbfpKpK5Bt8FQrINBvQ7duyz2hsb4SLpQ2MOPoG86P12AsWMUqcc/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795357830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QBjN2nkZH7Gcj/ZwiauxMt+VX48sTrjkI/4AB/9s0ZI=;
	b=skUtjmt8oovkJsDr2M6EgELJ/wapOUsTIipbTo2PEq8YZU4N8H8XUqEKJoyeDsp2hoqf
	 CPhVYe6p72k39sBjpfNZYCN4me15BTnEoCObj3QR//Rz+Q/SJzk4+F2+WmiNrqZpf+OfX
	 58L6NmWRKCqv4S95GDnDicY4jmNc77SH3Yjx5rU9igIT0F7e+QnpGhX3WMKTR7nCWMmwh
	 kBgbrAxxonrX9wUZmehVbzunz3JhH/BDn4pJHPLWleRwpqIPEVF1iMDukYrGF4Y/IZBFr
	 SctSAoBCEuWmuO1X99xAVEaKFJFahPt7m/qltQ1CdtCi1n8hDxvcT6Oa3585Nv0JJrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oEudPq9y;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A54B606A320
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 14:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A54B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oEudPq9y
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-386ab9ab619so582898eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 06:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795357829; x=1795962629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QBjN2nkZH7Gcj/ZwiauxMt+VX48sTrjkI/4AB/9s0ZI=;
        b=oEudPq9ya2d2ROLpUFNzQ4XiHlp7ADIN+XNA6G1p9I4nYDoV3eFVMegchsVJibGgHS
         Ny7j2I56wtelFeOltEglS6WsBi5zW1OiOGwoG/4MeAfCj/mZVYM7ppcrNgcad87bGbf6
         xGnoHXGOdgh/O8fA31vgDbvh+oau6MewMg25hYRS1qHURsa0Fi2yjma7MLOJvYUGvAy/
         zZu2h+AO2PKoCh8uV+UjDGJOhg7yw1I3G8j5rHWO9DCL9afUpUDpXjkOcQN9yEJC6p7E
         V/gn2CcvVKVol4dD/AtrwK4I3lf2HWeystQgnKw3GHzfIZilzEtqs85om9xYwx4Ra+Tm
         BNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795357829; x=1795962629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QBjN2nkZH7Gcj/ZwiauxMt+VX48sTrjkI/4AB/9s0ZI=;
        b=BJejA+TPk34dx2zRrU8kGeZjP815a24XiUeYRtGqjnExLwaIe8ajBNX+f/9/wDfBEo
         RbreZmFmuWd4mO4R7Jvuoov5q48KLsUCemwYcePvYTCMEbTJKz/YzushD3zrY/GQy9rE
         aqkCF2O3XdHV1VfUuxii0UCYN0Q4qHMiKQsuEyspGrHGJIq+vkB4T0KnMOfoniu7GQ+x
         kbDhd7MY30HwYnPxdDzxJsVVm78Z66AZZrIbJ2oKnMHSGpbjerE9XN60v1XdQWgWhjB0
         KC1F388YtO2how2FkUB+mHEZ+YKnqbEW97i3cisUsdZcTHUlNW/atulA9SSRSgFKYvuv
         Cl7Q==
X-Forwarded-Encrypted: i=1; AL+hErEOJOH+vYXhbIYuZJ/6CD/iAvtNigoWtGDEGc8/MFflq+6/pqCLNlY1uKVTiiER1Thwb0Lnyi00Fywzg50KtDI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yKStwl1X0hsBPlCgFc8T6fOl8b746mFyGhng8R8JnaBRKZrVO
	9Wn1Dgnzaq46tdbCnmdwJIIFUkVa6HGokIZiTAdoh3u7zoGdHh7ZbFq7
X-Gm-Gg: AZFdTZc9WcGrmo0QhcEXK0Xg+AZU5NvsLkZQUcixfC5isleE0wG4OZDqpuFepfVtvzW
	mxHxgUGHHalDoh8E59Y0KJ47iF7p0JlK9mliK0z/9ZAuPhpsVp3PsMYexDeNqJUaH6Tpiz8ET5p
	Qc8NVmrLCkT6n7japndqCoG1nVDXEZ19D+ZjIQNvQOyWH/uiC1H1qbjZfjNG4138xNjyjUaEyOK
	cgPwIPGClFzMgCv4RyxgWDJJd1GZ98wz7KmciHTJDQpghOjd4uVdp3HRATR0dWUEMmcJhu18B7q
	MvVDlt3a9NfxZ8EE2hqriuCr9iYU8wPWibqaZWYrk9ezBGic5+/NnHEKKrf5FbySNthxJRSpk1+
	W3rAcZMCOg3dUMp8U/vNb950xw3mtyXVFbv2dioDU8JKvPBy3RWo3VsWR7iKTh48FQLkIBzA0Ek
	/118mhUNDib19Vru531qA891dp1hJVMgeXFfLAKi6mEy8gCD1Gh06gHCdEO2qrTf4VAqDcMuzCo
	jY9FdW3NVPwsV3zqw0SHwC4l4Yor+siVUfOUDBtlo2MBlGFTMiE4Z4dvo8Ir6aLYhTeMsiSweLB
	K2pJJojm8clSVzSJVgAtzYxPVY0lh8hC5tF2mkWuA/Xu2SKKr9SqzVQsvztrliLwsRJKtnuvDuy
	5mL+81aX6yhXcHQ==
X-Received: by 2002:a05:7300:e9ce:20b0:36d:5102:9974 with SMTP id 5a478bee46e88-3856c2c2123mr11231914eec.2.1795357829128;
        Sun, 22 Nov 2026 06:30:29 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm27877901eec.9.2026.11.22.06.30.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 06:30:28 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 00/27] mm/damon: let users report their data attribute findings
Date: Sun, 22 Nov 2026 22:29:52 +0800
Message-ID: <20261122143011.85844-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121210013.130397-1-sj@kernel.org>
References: <20261121210013.130397-1-sj@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 21 Nov 2026 12:59:44 -0800 SJ Park <sj@kernel.org> wrote:

> Build a system for letting DAMON-external entities report their data
> attribute findings to DAMON.  Let users report their data attribute
> findings to DAMON using the report system.

Hi SJ,

I'm reviewing the series and setting up the tests. I'm also working on
follow-up test patches for the report queue and its sysfs interface.

My schedule may be a bit tight this week, but I'll follow up here as
soon as I find any issues.

Thanks,
Lian
