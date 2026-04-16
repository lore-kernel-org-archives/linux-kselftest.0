Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE783C1F;
	Thu, 16 Apr 2026 19:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776366260; cv=none; b=eZw3DqgqBbTtkAodzt+2x46tJcZxHw1w9YlylqmhK6/GWBCSpq5/f9OOfY5OHPfeKCpHRnCfE0PCG6skzfTJk9Uq85Ow8fMBzmnDYvl5gcUudrEIuTkQeyMvNWaYjTHJOmV0WQ3+wZ++ctBXmpeQogRVCpax7v2nvmZYnoXEOnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776366260; c=relaxed/simple;
	bh=8mr3mkY6V82GmBp12MQ2JnGViTZ4nXVPc2W539TWcrk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SWlTWv8R8cgYtu860kg4Lceu92MyHsP3fov+gmoy6D1A19bZL2zdeSBJV7uq08Ffdr72Nl//8o9y84Yobx3b9pMAwk0RBfdQ7XTJORMSU2aUlWPnbQtn+9KTrfXAKbgMxnFw/ojrBsDNvmzQhm0R/SXR/S43GemLqLDKjaEweHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Whp/iQSE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Whp/iQSE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8391C2BCAF;
	Thu, 16 Apr 2026 19:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776366260;
	bh=8mr3mkY6V82GmBp12MQ2JnGViTZ4nXVPc2W539TWcrk=;
	h=From:Subject:Date:To:Cc:From;
	b=Whp/iQSEMikPXjesQ6jS4xEIsR8AY96bl2kdiPCd43ERUbpK2cnDuodEl1s/rYoqK
	 gNJtyLyqwtLa4op9cXyeEWGOzVUNtztv9ic91j9O7OWzo+A1Y1heYXqzpP4RnSC1rm
	 GvoRSVMDrh8NoKYpiC8A5nMbiasSdmGg8ppmpBpRa4ZWpu6Fuiw3KJUbg8tQzQTl9s
	 YE2PcetmZ/LKQLjw0eo0DkfBUmRy4GSMaVX7uyqxXoWQ4My8hoG5y+/Gf2JlQNmyy5
	 qMo72rfs8eOyupgAYUgilUo+i9cStlIKts266+vL15leqEK6Sij14IxLKE727dCff6
	 1YqqkUJlGNIHg==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] selftests: Fix runner.sh breakage
Date: Thu, 16 Apr 2026 20:03:57 +0100
Message-Id: <20260416-selftest-fix-readlink-e-v1-0-94e4cabbdec4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ0y4WkC/yWM0QqDMBAEf0Xu2QMVCaW/UvoQzaa9VlLJxVIQ/
 92rPg47OyspskDpWq2U8RWVTzJo64rGp08PsARj6prONX3rWDHFAi0c5ccZPkyS3gwO3vZo1sU
 NZO85w4yjfLufrMvwwlj+Odq2HSBmpph7AAAA
X-Change-ID: 20260416-selftest-fix-readlink-e-da604f02686b
To: Shuah Khan <shuah@kernel.org>, Hangbin Liu <liuhangbin@gmail.com>, 
 Brendan Jackman <jackmanb@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=701; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8mr3mkY6V82GmBp12MQ2JnGViTZ4nXVPc2W539TWcrk=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhsyHRhvmLDyQOftysYpx6LerEl4JVtEqYUtXVj6ZdFRDW
 75yX+jvTkZjFgZGLgZZMUWWtc8yVqWHS2yd/2j+K5hBrEwgUxi4OAVgIis92f9K+Jm8FPH3/Bmt
 +LU2J74pJW1X3+yY9+JaMjJSC2yO+16x3NWnZVMeqPZ9Nk+bKZ9p3Vsm+dgthnVxjGJfbdk3VC/
 ZlJvr03Izb3LryXr7X+JGOxsCurYU6YWJTS2S9zaS9w0PEEqxr2dcfsqDsfOR0E9/FkvRT96VOh
 lhjC6PuvgKZ3vfMZKT+7El57J96SvOT9K23Hxbc6dIJS8z3WvOyJ745LFuCJPh5qyYL24yObk9B
 2e5XlH9cGm9ZrX6Ngffl7PPX2jcl2P6LOxQkG+A1SKZtj6/5+dMszky3lcu9VYtnmKaZdbopnqg
 m7nv0bH/wt8U5ZTyFBqW1K1Yrskov6e6qurS1c9LRAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Commit 2964f6b816c2 ("selftests: Use ktap helpers for runner.sh")
introduced several regressions by introducing dependencies on bash and
GNU coreutils breaking testing on Debian based systems.  Roll these
changes back.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (2):
      selftests: Fix runner.sh busybox support
      selftests: Fix runner.sh for non-bash shells

 tools/testing/selftests/kselftest/runner.sh | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)
---
base-commit: 2964f6b816c25ee094df4a143eb5b8828910045f
change-id: 20260416-selftest-fix-readlink-e-da604f02686b

Best regards,
--  
Mark Brown <broonie@kernel.org>

