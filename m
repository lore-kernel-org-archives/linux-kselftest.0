Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E5F30E0D5
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 01:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784683437; cv=none; b=Sx5PIPL5xaDnk6rCdgyElkrSjBT9EcVioNBMr3HKgXFHzwFZO6GB4VDS6kTuR3ffnDefSNjvG9tIDEplrkjqX4IC/1EQltfYOAL4JDynfPwkdwJdqcv0BwJsWvc8WyBg94sv49U5Y/fACDId6F9iN9hX9YL9acCpmocczyEh3ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784683437; c=relaxed/simple;
	bh=B3++cTbdJ49038jePsljx+Gyp4sIgoEM/bU7x9eRQSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ktjNMeQwsKQgqze4v41dpFOmDiyKMCuBks0JOtYEPw3+ZO7l13bwoId8m7EbTX2+WSAOvlVWPHgiZgHQrMEb/q2H9qURDbcCM4NE3eTnu2HZX2Y08HFiTOPKneCOeSL98C7SLEQFSCra4J4Jjqtfh7Dalv17qPevqSMZjoTB1DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iAePzheb; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAePzheb"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69f2c67650aso1425052a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 18:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784683434; x=1785288234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YbFXTrauONRUcQG2aMTBcn7xFxe1QUlq55ZfdY6FsS4=;
        b=iAePzhebx3oDmd9GM81JlJDpF3VlBWBy0JHaKNN3XbI7xt/OQ8jPtEdxRbp/4C99MD
         3xMf80uifR7TN2UjM97YlZVp64W95QIH2evj+xf2iSPfBdxRgPc/6G71lRnXQU9cw4iy
         wkO++K5zsa3y5FsHTbysSVbITnngBp7wVhEhuJ9NADlAmqE8PPvLgJy1qb4RfH1VC4tt
         jO21wsm3QSV0pFwhQ1h6IjPZHu+XKrS0dTkK76IekLYr4AGWcBC7yE4haTlUxpPcNfCs
         04OlNBRbD/V8G99ayvJrNGIyr0na6ppaqKBlNhvEk3DyrgDOpluw+wkBG3bDoiPpmvVp
         Q/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784683434; x=1785288234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YbFXTrauONRUcQG2aMTBcn7xFxe1QUlq55ZfdY6FsS4=;
        b=NONsKaRXNeHsEL3beG3QQxZUt5uUCfupC5IVa+PjXrVA/nfaKo4ls7L4+FAU5A3VgH
         6iGMir7iaMqrCIEabDP0IdQC2al/OPPouiUCtnYrKA95tIBLq1lzNnaaF3XccIcUxEiS
         7BPzEESjDfdtgioz0toG71MzJuhkMx6TERly6+4qxwOnYW4VGnQChD8IfzudVI/FGRWB
         x5oMMeVOuS1PDN2HpJiKPoYW6eJYnBLL8KV+LqikYcbAzBZFa4yY2dGY0OYu3IzOCENV
         Jc6Fj81wE3Oaghsgabl1eQr0UIcR59z4ZXIMuvlVFDKUGdKuf/ZGLSakWA/n8E0ui9Ng
         q8ug==
X-Forwarded-Encrypted: i=1; AHgh+RrnZD+Ciu9cv9ilABNG516qG5BDDkA+rODdW7XamZ97ZnWquYMQnhyhGhXYJXZEryWip4mkDFLLbtRK07TqRl8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt3YWl8MFzeUQyGSnujnUo2uLZt0wkFVOQT0NEl4LGLl5eNwTT
	/iuN6sER5mDzF5nsatUhfmCxuFWapHRjuPI0OdPCuwFnrNJ14FFVRNNg
X-Gm-Gg: AR+sD12NnLoCqXENoNjTynSakGhqWvvW3A9y3M6uh27ZZEnrx9bcISrl6+EhXlF82uI
	gyfvbDoqgV74Z0p5/2PSD+u5TAheBhEZvqjyxnKWFQKXCHdYpubXbVAvEBMRW9qve+JzbF7w9TQ
	aLGRlMVcLmtxlgNHiYYYcFec7ZdclLCxdcq0BR2Ysp1SOgDHQ8sZNfjjuTm6rAabJYfObBAtQKb
	BB6YOglEiuTeo+V57n9BGzdbkYS/RWG9TU8xq+j6shwBF0B0QLZ0CmJ2JemAZjgaBYEm/3aZ2T+
	uERtBFKTBtmdESoquMdFr1LVyER9X4g6ONnF/vZ8sNeseYileCa/hVm7/RMxO4wf3DE2FixSsCo
	lu5Uap/15/SJXWJ/FFZt9Hm3PB9qToDqqoU+Rb/055SpacW/3CVqLuDVIR/KKgDtn/LPqnp0TRu
	tmH5M8Z0yQi3lRH/fAyGuacvvo3K36zuG0XpzZO/sd/ZRCD1OmKT7/hJ02ybEBdtmt5Q==
X-Received: by 2002:a05:6402:528e:b0:69c:7406:9492 with SMTP id 4fb4d7f45d1cf-69e652e1111mr6897698a12.39.1784683434224;
        Tue, 21 Jul 2026 18:23:54 -0700 (PDT)
Received: from misharu.home (2a02-a463-a071-0-7364-df4e-3b35-2094.fixed6.kpn.net. [2a02:a463:a071:0:7364:df4e:3b35:2094])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34ba67f0sm321569a12.12.2026.07.21.18.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 18:23:53 -0700 (PDT)
From: Hari Mishal <harimishal1@gmail.com>
To: SJ Park <sj@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hari Mishal <harimishal1@gmail.com>
Subject: [PATCH v2] selftests/damon/sysfs.py: clean up sh processes used for obsolete_target test
Date: Wed, 22 Jul 2026 03:23:49 +0200
Message-ID: <20260722012349.9738-1-harimishal1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721190404.135937-1-harimishal1@gmail.com>
References: <20260721190404.135937-1-harimishal1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The obsolete_target test spawns three sh processes and uses their pids
as DAMON monitoring targets.  These processes are never terminated or
waited on, so they are left running (or become zombies) as orphaned
children after the test program exits.

Terminate each process and communicate() with it after the targets are
no longer needed, so it exits and gets reaped instead of being leaked.

Signed-off-by: Hari Mishal <harimishal1@gmail.com>
---
v2: Terminate each sh process directly instead of giving it its own
    stdin pipe to close, dropping the stdin=PIPE changes and shrinking
    the diff.

 tools/testing/selftests/damon/sysfs.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/damon/sysfs.py b/tools/testing/selftests/damon/sysfs.py
index aa03a1187489..bdb37eb1d26f 100755
--- a/tools/testing/selftests/damon/sysfs.py
+++ b/tools/testing/selftests/damon/sysfs.py
@@ -356,5 +356,9 @@ def main():
     assert_ctxs_committed(kdamonds)
     kdamonds.stop()
 
+    for proc in (proc1, proc2, proc3):
+        proc.terminate()
+        proc.communicate()
+
 if __name__ == '__main__':
     main()
-- 
2.43.0

