Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D661368970;
	Thu,  2 Apr 2026 19:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775157796; cv=none; b=B1T+uy2nvtI+JlgLP3Ege2lTggPe1ZSfskJI2Q0Gxkyb1dh+pY5m1KKMeg55rvqmmfYdyV8cXoiBtkp+w4TVtW2KjeJcc5Z4CBVxb5I27CDbAJvIGPBxEZMYU8/NmQPLu0DEoND5YA7JL7IupXK0f7O2uyuc2aDEOuPliONzLQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775157796; c=relaxed/simple;
	bh=f2+Ub+/XHAQtGZGd0USzUQOvu7S30GC2CkbVfIlj3UQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AmDDHp6vfctAadElHgLdnAI1pujEI96e6sJuuox8xYOtBcFHDZYfd1AixtqJQ2R9XGvk7vYLX8dySFjvPnuaLsvIVa3YpmAIEeyd07vmxCZgdmGIodu+HlPtnsnxVpokc67jJzw6oHPH3SjBloao9ha6NyMAIciOpA59G3TiEiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z9BRkx5w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9BRkx5w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38166C116C6;
	Thu,  2 Apr 2026 19:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775157796;
	bh=f2+Ub+/XHAQtGZGd0USzUQOvu7S30GC2CkbVfIlj3UQ=;
	h=From:Subject:Date:To:Cc:From;
	b=Z9BRkx5wW2WycbpfRmslmBdGpLtpYUtGN850Ju9a/SXZcSz1Ivw+U6OnJGV3QuZyB
	 3II+pYcl+mgCliGtGE7PyXCDIsUjr5pPyoGr5z2OrY2Tn7hGiCorKNOniWrGqWYwvj
	 1L0WD0FAVHKhwryo6GBmkHJyBRg99Zo5myAPcbmEaaHtozVppm4y1tz2lihov3XGrD
	 vVRnan3MZrOL1vLsrlCikTcbKHiVTwS/vtr8M/9i8Z/aUGo+9WJQauCsZ/cXVX1ppS
	 0cBfTLxdYB5CqQkdXgroZAwG6TbPVeLbfwUcFLm7YdKzeH72b/oWM45zpHqFaFNy5q
	 3efx6ngKs8bEA==
From: Jeff Layton <jlayton@kernel.org>
Subject: [PATCH v7 0/2] firmware_loader: allow firmware_class.path to take
 multiple paths
Date: Thu, 02 Apr 2026 15:23:07 -0400
Message-Id: <20260402-fw-path-v7-0-5b7e9c41a8c0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XO3U7DMAwF4FeZck2QnTg/3RXvgbhIWmeNQO2UT
 gU09d1JJ0GHql0ey9+xr2LiknkSx8NVFJ7zlMehBvd0EG0fhhPL3NUsFCgLGp1Mn/IcLr0M0FC
 rQZkmGFG3z4VT/ro1vb7V3OfpMpbvW/GM6/S3w/91zChROu+pa2Ky6NPLO5eBP57HchJryaweQ
 FWhDwiWY4McaQf1A6grDA4wgI9t/X4H6Q4q2CCtrxpyrBJ0rd1fNPdQb9BIkOx9VImRTNI7aDd
 IgBu0FRJHdkCEXjf/4LIsP1/Mu628AQAA
X-Change-ID: 20260317-fw-path-a094c30259a5
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Michal Grzedzicki <mge@meta.com>, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2294; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=f2+Ub+/XHAQtGZGd0USzUQOvu7S30GC2CkbVfIlj3UQ=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpzsIiE5On+4gj28VEsMqCeO77m0RnBuSYxC78I
 7ibSZJlfyiJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCac7CIgAKCRAADmhBGVaC
 FajcEADGKLXgX1KpHn49SpZP07SOLmRO+8g1n8gLgCpDDVIWVu+iXUsGQXMutBaqMhPGsTI0NPF
 YX95lBIagY+RsoM5KnzveRv2HJlm0BFVAJZn/Dvbxf2D1L1EFqugWObRB9bd5Ct3oi0Pqbe7Dyw
 pKJoB0fUmTsd47bGfC4H60l7wVKTt5jYu78bd2hlHbbnUPX+Jz3JhIZd03UWY2poSN7/Xj3AoOP
 wknQYEnyI0Jzx3A5A18PjolFLiBFVNrGGNHXYfo8WvehIRX3RHWBSlFXHXII2sAx03R74X7dpAc
 McDwJKGApE/+c+C1JrLCZcAlbODhxu8sa8CvGUGYdxvH/GUTu4SdFHQ26RgenG16vno7zI/oMZu
 Rdb2qpzo9H4pcmhIIPOk0TML0L6Z+k1EZEaOb4klBX0LBJsIQXmgb6lig1tn0kV0nvyx08FXp/s
 7HM5jbkG/klFsHFyuEEyk6JZulr0c9qcT4FWuuonpDJE3jHxZVNskdtbPdibJoFgI7vLx3SziZm
 jShvMOB+yIhZNaBOyI8oagirHvwnQb9S/O6+nT4FIRajllGUf/57pCQl4RP/7t7tVCABdduhtw0
 cnA70WdcEz+m0dJlKCKVQpYqm+exxH3U6qr79EF+XQ9m4asv3RhhHMIoBmamrhP7ufUXmlySLLt
 /SynRMWZ6S8ft8A==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215

This is something Michal had asked for last year, and I just got around
to implementing.

This version is mainly to address Sashiko review comments:

    https://sashiko.dev/#/patchset/20260401-fw-path-v6-0-4ebe70441839%40kernel.org

I fixed the ones I felt were reasonable. I can explain my rationale for
not bothering with the others if anyone has questions about it.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
Changes in v7:
- re-escape emitted paths in fw_search_get
- fix potential out-of-bounds read in fw_get_filesystem_firmware()
- ensure all files are cleaned up after failed selftests
- Link to v6: https://lore.kernel.org/r/20260401-fw-path-v6-0-4ebe70441839@kernel.org

Changes in v6:
- Add fw_search_unescape() to make the search path parsing more readable
- Rename search= to search_path=
- Link to v5: https://lore.kernel.org/r/20260323-fw-path-v5-0-e88b2fe145f3@kernel.org

Changes in v5:
- Increase search= string length from 256 to 4096
- Preprocess search= path when it's set rather than on every firmware load
- Add selftests for search= functionality
- Link to v4: https://lore.kernel.org/r/20260320-fw-path-v4-1-7547e2f0dc64@kernel.org

Changes in v4:
- Move search path to new search= option that is tried after path=
- Link to v3: https://lore.kernel.org/r/20260318-fw-path-v3-1-a701a08bc025@kernel.org

Changes in v3:
- Allow '\' to escape a literal ':' or '\' in the string
- Link to v2: https://lore.kernel.org/r/20260318-fw-path-v2-1-8a106eb91eb4@kernel.org

Changes in v2:
- switch to using ':' as path delimiter
- Link to v1: https://lore.kernel.org/r/20260318-fw-path-v1-1-7884d9bf618f@kernel.org

---
Jeff Layton (2):
      firmware_loader: add search_path= module option for multi-path firmware lookup
      selftests/firmware: add search path test for firmware_class.search_path=

 drivers/base/firmware_loader/main.c           | 305 +++++++++++++++++++-------
 tools/testing/selftests/firmware/Makefile     |   2 +-
 tools/testing/selftests/firmware/fw_search.sh | 217 ++++++++++++++++++
 3 files changed, 447 insertions(+), 77 deletions(-)
---
base-commit: c369299895a591d96745d6492d4888259b004a9e
change-id: 20260317-fw-path-a094c30259a5

Best regards,
-- 
Jeff Layton <jlayton@kernel.org>

