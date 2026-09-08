Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181C3576EC8
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 17:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887063; cv=none; b=fGPsxZCtttHc6o5FPmZ6hS6RwxOhjnAJdAGlj7jcIv+D9SKE3Onfj3RIPLGdWb3saE/Cfwe4BmkjqpCrkoo3oPpI0HO330F4+xfuhC/I6U2VRXstXwTeFAj6BDUxoBf+0KXqVFhggTIfu5g7Ebu/R76YwojAcwFMTHosl+dzI3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887063; c=relaxed/simple;
	bh=eL5BzlSm68HwvXBbEKQDBjRCnLF8bcFOZ1bx8ziLs1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BdluKnbJws9+J9PiXYguTWchKaBl6KdWf1+Aa3CoOmUk/utVeVWIq6VmIik5BMCs4+e3OBnNnhv3sM/uHEpcoJv2b0FovhTmsnw382l7NCyEYi6FT39h5D49eMJDd7c0T1+xYIyLb4Z9NANW7f/fi7I+CxCb2+RlzVAeFmmwWNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLSN/48s; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLSN/48s"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-52e2d1bdbc0so30684841cf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 10:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788887061; x=1789491861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eL5BzlSm68HwvXBbEKQDBjRCnLF8bcFOZ1bx8ziLs1g=;
        b=GLSN/48sJa74NbmhSIGPVfMVRtCzr+vwI4HAEZWCTyLUtV/Z0enPgx7bSn6yjN5Qj9
         5fYCGz5/lnyOAtAYr/Reutip2fh7GglsaMyYKncDTIey046mr+mWPz5EEt4PrQ99W3le
         hKGYqwRBN9CJGMNqrVPWI/jM9KSx3Zq9A2TlOvAb+sV3zqTYA7WgOoEx57fUSiVzruUj
         x4HVHVb64bVcCWO4Gy1pKbYs95lu7jzl8cMs+sdlFy0/Q4s7p70lhPXIX7GtA/wjHOUl
         prOmli3SCeZ6NICXart7rVkeBfDX+biYR7uoYdsZfA/WCTjKMw2MVlNqymfGHkjwSJl1
         Vk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887061; x=1789491861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eL5BzlSm68HwvXBbEKQDBjRCnLF8bcFOZ1bx8ziLs1g=;
        b=gYB7OQM6/9SifufGTMT8LBwoKgfhLa+pUXyKTENQM8pyYqJpLhgY1NtzNedKKlUnzD
         QEIekvtcFupWoGHv/KGw9qb9HJBB+8q7g77IJq+yYEWD41/qtip+GXMCVOGrKNizNXsE
         mcSD9x1l4492oPqa39+xRcPoiCgapBLPKl3t1sdVGtKRcLLNCNzBgUj9G/+K46xbEfu4
         wBH41dlOCU/kcRW9S2QGhN0oU/Y0cpy8lML80NhlAd+CxqwXh9pFieuHhG4dJZaF9teu
         RI/CdobVvvsTU4vT+ek8PwaAB/tX2cYspXX6LmtEfx1zOm+Iz/C1dKPwZrMhz484V8kl
         OWZQ==
X-Forwarded-Encrypted: i=1; AKwUvByMNtx7XY0Ve2YQViTnAdb9doIqG+HyecEHFQqGE57XFRNYnq4RatKA8oQAJrFHleEdpVDApmcJR4ootT9c+ZI=@vger.kernel.org
X-Gm-Message-State: AFuF++ndLyGlBYYKg1W096pNJheJFDmhO1oRjWdAV+EpjB9MkZkB3wyd
	zJhiLxFu42ifaLDS17CXwYK40PxI3qiLOEdJ5d3UrYvXwH727hB4b9Ki
X-Gm-Gg: AYBFou0TONRwdRZjRxtMLl/YEm33hbObqs9c0dh7St0mkuZVxqwPRq3z80yAtHLLt6m
	SXEppe8E/UmTeeDTyr0ooS/tkGTyDTXPL7Ez7UX0ibu8/Ms13ENVqOJilotrB5bsUNnbsr6TroP
	sq6PPP0UMMrabTn4853k68jgyxsufy7Kqmhh3N21TApN/itHLbj8zQ338PqTLljWmuNBOwqlM5N
	ZPPlUB1VYA5pbynLUlg2NUaWoRjqFeHtRKHIm/3hVRGfhmsVZsGo8orJZevSXpjRISBCKcHEguM
	bXE+MDKcrmBAISRm2hAF2iMp+lVVpLZKocXaI/zhWMfWtfp3+Nl6L/EZKM0G779a2pt8gIBnCEg
	DtYJL7rx8VA0s98dH1Ezv4ziRhHe64S/hN8Ycj4TDgTHJQEfntV5vcF9N+8AKmqPe1mseobA6I7
	+eizL3l/VKeeaNySFGo4UeasxbGSvzcdrp549tanZXKFEnm0KJ+kW1TYI8
X-Received: by 2002:a05:622a:1115:b0:530:430f:b922 with SMTP id d75a77b69052e-53054a32ce5mr341661691cf.49.1788887060532;
        Tue, 08 Sep 2026 10:04:20 -0700 (PDT)
Received: from houminxi ([163.123.141.225])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530a2fdcf8esm3276901cf.8.2026.09.08.10.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:04:19 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: Minxi Hou <houminxi@gmail.com>,
	Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [net-next,0/4] selftests: openvswitch: pylint cleanup of ovs-dpctl.py
Date: Tue,  8 Sep 2026 13:04:10 -0400
Message-ID: <20260908170410.1952842-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905104026.3776396-1-houminxi@gmail.com>
References: <20260905104026.3776396-1-houminxi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

A v3 of this series is coming. On a fresh review pass I found that
patch 3/4 had its docstrings shifted by one method (they described
the wrong operations) and that two renames that were meant to be
dropped from the original series had leaked back into patches 2/4
and 3/4. v3 rewrites the docstring patch, drops the renames, and
puts the stray hunks back into the patches they belong to.

The pw-ci contest failure was a rebase artifact; v3 is based on
current net-next.

Thanks,
Minxi
