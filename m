Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313983;
	b=jpUYPuwmNK/6oh+DuhqyCvxPJYP5lpxIP/vFkVHWusVZIXCSU0c84Yf0gs3OVN+++TVu
	 2F8SCgs1zC0+ktacmo9HZc9/THr7eOVIHilf2bRlFz3VDM4gNJBZi7BywcXzRzR/Ak0v8
	 DmHFN8BbYMsDtQXU6S0DV8P479s+ruopRSP+v5kNUP8s+j9JbEkNlQHJt08zWRQ99t671
	 Nanos3qbQEGYs7tg5cwm6dr64OZQaEo7EUQr9/JGnHVvg5Tmzx4NbGj7LTvxnt8AK2vIO
	 m+Bylw6EDscWLaaGqaRJwErc0JeuJ5wC2NNDULzMdKBIJEkUdU9PJQGgxN+iankOKuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313983;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=uXHrdWcqiHpJ/+X7spV4X+YSqEs4YGoqydo4TrppAyA=;
	b=gXxrFHATUSuSYHTdZJ8PbJks86IDdb85/ViHd+gYAet2jvgJK1s4RrhZnm7RaTwop8E1
	 IOHaij0NFEW+IDKfkIOrz4F5SeJYKoA66ZM7ByuKx0vNVYs8Cow3vdbAM1W5vylAxrXNq
	 UDEMZC7PsRZyQOpzAtkdOWfMe2bgB2N2D1NaWWKiuZTmG/xBF/X25mmy7LYMp1xS5YwBM
	 0z2JzHmSWd569HMyk6Psw2UAKCg/1G875Fug70T0QTTG7IN9txZb3602bFegvwfoFnx9S
	 l1YweXG3qT3uhVH5O4PnHIsQ7TSnNGghmRARyzHE8MwQsVNWVQv2Qsq+cfwWMhIC2JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b="suwBrA/n";
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BACE606A326;
	Tue, 10 Nov 2026 12:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BACE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=suwBrA/n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=uXHrdWcqiHpJ/+X7spV4X+YSqEs4YGoqydo4TrppAyA=; b=suwBrA/nAsthm2JS9BiVooHsyZ
	VmGmrgtUn8GSiRlcSV8Bn7v4lkqYoSzypMnCvGkwESfSmjDRl+X+2ezZhc9slm4hVDdu15a1oqC8y
	FQ5WsAHx99+UI67Hv3vZHjrV9Nfs9l30fKxquAH86xlFzTEYRhM3D+3OuzPeVZplI6YeqKj//B4zG
	QN5Ml3Id34TXvSkkMz1XvtvCKAtrEY8ftyxXrC6dmxZm3d7WfNNuVbE55e/AXX8Sx4+PVRrn7936R
	hujqIkNiKWlgSc8ql2gP1z7JeBRbqhviJ9vnRvbF5zP3eDMiuSnv40ZfLDl+mrY88fb6plA9X2PXx
	u6CMO4qg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xQl21-00COyt-2d;
	Tue, 10 Nov 2026 12:32:58 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 10 Nov 2026 04:32:25 -0800
Subject: [PATCH net] selftests: netconsole: enable the targets created by
 the torture test
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-netcons_selftest_fix-v1-1-86643b837216@debian.org>
X-B4-Tracking: v=1; b=H4sIAN0O82oC/x3MYQqDMAwG0KuE77cFW52wXmUM2bpkC4w4miKCe
 PeB7wBvh3NVdmTaUXlV18WQKXaE8nnYm4O+kAmpT1OMsQ/GrSzms/NXGnubRbcwlqdMw5CuFxZ
 0hF9l0e1sbzBuuB/HH/DU14drAAAA
X-Change-ID: 20261110-netcons_selftest_fix-4cbf633295ef
To: Gustavo Luiz Duarte <gustavold@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1706; i=leitao@debian.org;
 h=from:subject:message-id; bh=zSq8AOVPqKnj/9CHTFOYb9X/z7p6pl2TpOdMOIPN+og=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq8w71zvOB+X5okMZEU9Ai0aXgzKngHTwprGRqF
 FostGn+XC+JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCavMO9QAKCRA1o5Of/Hh3
 bW1kD/4i/esf76C3fPut8KLl6FD9Ac8fm3Tn/C6cUztJyqnqwfd43nVET+taoAitIB5dKCDOxNf
 6UzzV4s2+Q9CIiA6LbhTZkajmI/LIuRzhDl9FkKWiDIpfVkASUb757A/DORDkNLbiWYeuFtDcsp
 vKdkMR7bC9dptkdiC8FZLSs8KsUZqxoAFfYscoMK+lzraP3r05bddR+Oz6cunEvsyW+HdEFGRyp
 5mmTQSn5u8QkToZR9LPI1tWBl8tgWxwkMXmJ5jPGvJ8Q9o2dGas7bYKA5HajuVR1gvb3nfog8AM
 wz4yxC4pCa5U4VkveHcLzz7IBkz26xZVvM4/YwxDMErQ8MMpko3RA4AE7p5cEEKrv1EiSBTIRa0
 1Nw9f75hmYP1pssPGiSS4cMaJ28LMVz95nGMUjAPzinlVsE6gX1wvlA5TXJ/vJ5DxcSV+CspaoF
 AHR5rJKS9N7TbdNXtqCExLwx66tlVIoMP6FeghV9zgSkwJAAGisEIQNKktxCk2VvokSFOCz7sJG
 HjL4nbG1UB28fuUIYGezCbV4M5Sx0fi+uZMHJjsC9lRnRrwVmRfMowcddwjON9JEE6jpv0elrp1
 B6uc6QJZ7CCFQs+xuDa2WYmEU92JGOFi22iCB1d1US0MbuqftDpI/u5edGl42nlHq7T+xqQbcwI
 GHGVwN3fa/oUD9A==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

create_and_delete_random_target() is meant to create, enable and remove
targets while messages are sent, but it only creates and removes them.
The helper it calls, _create_dynamic_target(), stopped enabling the
target when the bonding test moved that step into
create_dynamic_target().

Enable the targets again, so they come up while messages flow and are
disabled before being removed. Like toggle_netcons_target(), ignore a
failed enable, which would otherwise end the function and leave the
targets behind. With a console per target, this also registers and
unregisters their consoles under load.

Fixes: 236682db3b6f ("selftest: netcons: add test for netconsole over bonded interfaces")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh b/tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh
index 33a44adb6f8f3a..3dfab0bf1b0756 100755
--- a/tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh
+++ b/tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh
@@ -46,6 +46,7 @@ create_and_delete_random_target() {
 
 		# Basic population so the target can come up
 		_create_dynamic_target "${FORMAT}" "${RND_TARGET_PATH}"
+		echo 1 > "${RND_TARGET_PATH}"/enabled 2> /dev/null || true
 	done
 
 	echo "netconsole selftest: ${COUNT} additional targets were created" > /dev/kmsg

---
base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
change-id: 20261110-netcons_selftest_fix-4cbf633295ef

Best regards,
--  
Breno Leitao <leitao@debian.org>

