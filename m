Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFFD3546EA
	for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 22:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792361101; cv=none; b=qaLMeXo+7PrAm1UymohdWmNHfpTBsz7wa4NEhmtQwiIhVaa24wKQOxwIUwl1FXmPXRpqs1e4tAGCR93GMPuMSR574LwPaLt9vA9zARjoWKFiC419/JudqqnMBl3RPsY9+53ObInoOiOclHhiV2S2MDnu4fMq1bKpJcZO96fkxsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792361101; c=relaxed/simple;
	bh=HMm8MU0ai0yuTQwxN6AZ7cjuZpabyMi4cgQPa/Jbj9E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UB9fIcIVTiXGROt8z10ri73Q0imiODcarqEn9NJ8urVCIB2ntHsYmgErMMxrS3XuhF3hKk4WEN22Ii5zti7oOhreF0hv7pqIxC0Q09/OU7I1fk1fgOdFJNbI76PYehmUAIdFSDM09d8QoZrB0dEqXuqT1q169fA3QGLmW9AqAYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWGnEfjJ; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWGnEfjJ"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso475986a12.3
        for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 15:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792361099; x=1792965899; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FXXu6sXqJk8SsG+U0f2HwCixxxfND+avQe3AD+r/VSs=;
        b=jWGnEfjJPniSeVcbPWrgIpVJxSHni9qn5y5aId108nT9OEkVkw/sP2up90WI1DEudt
         JiePtdWJpkYxSEo7YwLTkdKamKahooJbe6HhiJfjB6aeixqV/ThT56WmSBgyut41O4Ru
         Cj4zolTkA9EkjTspPSySt+OMUC0DDy+W0FlUX3XZSj9BofSn8yX2bD/x85Ux4vFrMLfF
         1HuwsAJqhMuZjzsyOJgXCa3xvTc43GBtNxWYbjMtiE0y+62z+4Lbiuc7GWWEFdYATRIE
         vrHqpmtcFjFbs9+yzySQpW7q4jshQguU5zn1o3l+Kh2++hIZF9PMiDr1lbLEy0Ca7Hyt
         LP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792361099; x=1792965899;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FXXu6sXqJk8SsG+U0f2HwCixxxfND+avQe3AD+r/VSs=;
        b=NdZ91c2NHc1QGjViBnsR3WZENJ79kbchPW2XCVtEsNNUGzxk1phcUDCsFyGeJQGDoT
         NcsUMtxPSjCTaOPa6l859OoWcOrarg+wCjMjX8/Lum2oi+ox9KXIvAONtQ7F5P1bSOE0
         4u5ctZ4gziUMjRql4hcxXY8LX5FNELqEj0XkVn1MmQtHixW/figFYORDoBobQrhc/bPr
         wcMeGvfLXLVrOw5wySSFUt+oLoXO9JZIBvPd3iMpn58Ln/pV6TQk5qqrW981XUs//LuO
         zG3e/7FsTRXuh7W+qKLNS2T5Dj5VQNDpu2X28+mVx+jO77lziIENhuCjMnrg/myAiaz3
         q/Mg==
X-Forwarded-Encrypted: i=1; AKwUvByQ6nwhMlJsccF/3hnCg8GfyU/DeaXcqHYTkxIEizwdqIyp6Xd9HW1YuZesmBXH9OZPVSC8ajezWW+2gUkT2j0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCuw50aejb9Y6uLyR3pFQP4Klhf830xuY2ygZre0QXX+9Sxc4g
	krTveuS9UvXNo6uuaKzTMQAfEejSe6TuHvYnJdG712fy4ZCTK+CRx6Pn
X-Gm-Gg: AYBFou2olAUpzsDC8EUjGJ9vlvDbr8IXIxE5i3FbxyYN3l43PSzh8WVqw78IoPsIzGc
	WU967BNcCHoiYCuSFVh5SBiUQJ8tztF8Jhurh5RRlkh9PJZ+O0KQXfrhSJT/mwDo9HizgrHTiKp
	m4/QFjKNaBsCcDok3NglFKziM4y/rS7t6Lt2N9eH5YsbhGJInZBsYQJNt6sjoI8JM26Ksmbq4ci
	dGyR4As5LVkqPjN2CyXVyt7g8LrCIWTFSBKgWHYDuGmNGbNwW2bmwk5XNnCxI8BCR+r1RY0InPb
	uVaOa61qLyhFNuKGqZGESKkW4ieYA14wSbbFZ6rO5kr+WzUAyGRMa9Px5VBdFCv8pcTXFL6dQn7
	Z27MaJZ2CvmKIPVuAanlooiDhX5CNuu4kDsZBDKoxjTn1YL3I01VFQ/wMRuNLoKFiD28k4kFswE
	E0nFwlzF7Q6MmoDQa5o0IbVrkf2hpghgdOIZVOTo4amo1FUjIFdrVOIKPhajaAhyA3aB9tJQ==
X-Received: by 2002:a17:90b:580d:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-3acee2939c2mr4818318a91.3.1792361099415;
        Sun, 18 Oct 2026 15:04:59 -0700 (PDT)
Received: from [10.1.2.130] ([67.185.120.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac945e72c6sm17718271a91.5.2026.10.18.15.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 15:04:58 -0700 (PDT)
From: Kir Kolyshkin <kolyshkin@gmail.com>
Subject: [PATCH 0/2] cgroup: fix cgroup.kill for exited thread group leader
Date: Sun, 18 Oct 2026 15:04:38 -0700
Message-Id: <20261018-cgroup-kill-exited-leader-v1-0-c71ad94c20cc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrDuQSbHYXkW6CMlfHQwqEy2Ce
 PeGLr/FeycVmKLQqznJ8NWiy1wht4biGOYBrKmavPMPcdJxHGzZV540Z8ahGxJnhATjIK20T3T
 R3x3VfjV89Pi/+/d1/QDnsFMnawAAAA==
X-Change-ID: 20261018-cgroup-kill-exited-leader-a15159e8c230
To: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Serge Hallyn <serge@hallyn.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, 
 Oleg Nesterov <oleg@redhat.com>, cgroups@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Kir Kolyshkin <kolyshkin@gmail.com>
X-Mailer: b4 0.14.3

cgroup.kill fails to kill a process whose thread group leader has
exited while other threads are still running, leaving the cgroup
populated. This can be used by a process in a container to survive
the container being killed, including the case of a container with a
private PID namespace, where such a process is the container's init.

Patch 1 fixes __cgroup_kill() to walk all threads and to send a
thread-group-directed SIGKILL. Patch 2 adds selftests for both
scenarios described in patch 1; they fail without the fix.

Tested on v7.3-rc7 (x86_64 VM): test_kill passes (30 runs), other
cgroup selftests show no changes compared to the unpatched kernel.

The issue was found in crun, see patch 1 for details.

Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
---
Kir Kolyshkin (2):
      cgroup: fix cgroup.kill for exited thread group leader
      selftests/cgroup: test cgroup.kill with an exited thread group leader

 kernel/cgroup/cgroup.c                     |   4 +-
 tools/testing/selftests/cgroup/test_kill.c | 158 +++++++++++++++++++++++++++++
 2 files changed, 160 insertions(+), 2 deletions(-)
---
base-commit: f909e534f5e34feb2ea2701d54df63e21aa506fc
change-id: 20261018-cgroup-kill-exited-leader-a15159e8c230

Best regards,
-- 
Kir Kolyshkin <kolyshkin@gmail.com>

