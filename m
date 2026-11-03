Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721285;
	b=LGKZxFwkkzCuxR4M+JFuw4FAd28LbE5hCFEH4QrNXIDqY9ZpUJoP9sd2tN0e3KIt8IGZ
	 FX9+FY6Rt772S3QnEKvGejBEm2alRA+TonjU1SrCtOH4uWRhRoTZCoI3eHgVo212fPx13
	 ap0uy6vpsmnU1JCq7KLCeTUVm39vAtBLXy7aqaqDFC5FxBVgudtp+M8PKMKks9guu4bmF
	 6iUoTPQvXUNH2IaQzXbB8NKQ9ChRld61G25oSu06bMpZ7c4x1NrLPyARslKgo+PJ4duqn
	 LAlsbkZb8v2LaYNDmchzes1pWSR3qZoxn+GwUwlSfT9+QU3J4+CkTKRFNre1HChpw9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721285;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BtCx3J4pR7AaZm5gEtmZSSdNWFEZJJaJEEBMSycaNwk=;
	b=NIYJkePKbIdjzKl8w8VQRvcPjeUC5b9NcSIDACaZ/JWljnwWrmt7mNLB39/HEovPGIxC
	 RrcZjaN47OmNJtuQv8x2JiqtgyRYWDnB3s3vJrKDnlGwXr8xxNU+VrxNPSocz8lvC2bZL
	 swpYZu54CFBOhYq0UlhM1C5JUnc4esJMlyS6N2nvy7HfGf8HpQyfM5WirpFLQ1O9N1IYy
	 fy/82acBZVNwL1+xuwRd38l463IUP98SOB1MHMP4DdBKoD0Vdf2sP+LpA6nAnnynVWV0y
	 ZU+0sWKTQKwk0cIYSkGNMMYjLOeFhAsDX8xfQnHmJmGgqDgAot+BkJYWZJ1InM0s/fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fbEVwT+G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAD8606A327;
	Tue,  3 Nov 2026 15:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fbEVwT+G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093D51F000C1;
	Tue,  3 Nov 2026 15:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793721285;
	bh=BtCx3J4pR7AaZm5gEtmZSSdNWFEZJJaJEEBMSycaNwk=;
	h=From:To:Cc:Subject:Date;
	b=fbEVwT+G+FcOHUoT1D6DZBK+mkuxbYJ0mo5fcDP3n1KcPYDZfpLWZey8sMVwtwFht
	 hpBGBn+QwZB/NWbC6fD+KGQs+UvBTPRirMHSAhN8n9EVsiOxrPmzkRD2Ua7k9yTWNZ
	 4+I3oczPXTig3bhFmwG4S3nuLhcBZBmREc7pEnQimvKHtmgsphqiV7fYSof0HVp6St
	 mC3DUHQ1lfTzPD/05z2lRqnF2wqVILgXp+yfri8mpLb/KRrnnYJ3yknAy+SS3L7B5T
	 Bsb7c9u2B6Ns3o/0+SqAcIjwjl9kwdeF7oTJr/zH0vpxK/+SA2S/oHv5dEeV1HnW+R
	 I7eOP28BHzpxA==
From: Sasha Levin <sashal@kernel.org>
To: John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests: timers: print time values as long long
Date: Tue,  3 Nov 2026 10:54:42 -0500
Message-ID: <20261103155442.534141-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
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

On 32-bit architectures with a 64-bit time_t, such as armhf in Debian
13, time_t, the tv_sec fields of struct timespec and struct timeval,
their tv_usec field and the freq field of struct timex are long long,
and printing them with %ld or %lu warns:

  leap-a-day.c:142:69: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'time_t' {aka 'long long int'} [-Wformat=]

Cast the values to long long and print them with %lld. While at it,
print tv_nsec, a long, with %ld instead of %lu, and cast it to long, as
it is a long long on x32, and print the unsigned long frequency in
rtcpie with %lu.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Found with a 32-bit build of the selftests with a 64-bit time_t (gcc 16
and clang 21 with -m32 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
KernelCI's 32-bit arm builds show the same warnings. The changed files
build without format warnings there now, and the x86_64 builds don't
change. The other selftests get the same kind of fix in separate
patches.

 .../selftests/timers/alarmtimer-suspend.c     |  9 +++---
 .../selftests/timers/inconsistency-check.c    |  5 ++--
 tools/testing/selftests/timers/leap-a-day.c   | 28 ++++++++++---------
 tools/testing/selftests/timers/rtcpie.c       |  4 +--
 tools/testing/selftests/timers/threadtest.c   |  6 ++--
 .../testing/selftests/timers/valid-adjtimex.c | 14 ++++++----
 6 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/tools/testing/selftests/timers/alarmtimer-suspend.c b/tools/testing/selftests/timers/alarmtimer-suspend.c
index 120b3ce8b39e8..c1d87cbfee27e 100644
--- a/tools/testing/selftests/timers/alarmtimer-suspend.c
+++ b/tools/testing/selftests/timers/alarmtimer-suspend.c
@@ -60,8 +60,8 @@ void sigalarm(int signo)
 	delta_ns = timespec_sub(start_time, ts);
 	delta_ns -= NSEC_PER_SEC * SUSPEND_SECS * alarmcount;
 
-	printf("ALARM(%i): %ld:%ld latency: %lld ns ", alarmcount, ts.tv_sec,
-							ts.tv_nsec, delta_ns);
+	printf("ALARM(%i): %lld:%ld latency: %lld ns ", alarmcount,
+	       (long long)ts.tv_sec, (long)ts.tv_nsec, delta_ns);
 
 	if (delta_ns > UNREASONABLE_LAT) {
 		printf("[FAIL]\n");
@@ -103,8 +103,9 @@ int main(void)
 		}
 
 		clock_gettime(alarm_clock_id, &start_time);
-		printf("Start time (%s): %ld:%ld\n", clock_name(alarm_clock_id),
-				start_time.tv_sec, start_time.tv_nsec);
+		printf("Start time (%s): %lld:%ld\n", clock_name(alarm_clock_id),
+				(long long)start_time.tv_sec,
+				(long)start_time.tv_nsec);
 		printf("Setting alarm for every %i seconds\n", SUSPEND_SECS);
 		its1.it_value = start_time;
 		its1.it_value.tv_sec += SUSPEND_SECS;
diff --git a/tools/testing/selftests/timers/inconsistency-check.c b/tools/testing/selftests/timers/inconsistency-check.c
index d7982ac4bd18b..e8012fed2280c 100644
--- a/tools/testing/selftests/timers/inconsistency-check.c
+++ b/tools/testing/selftests/timers/inconsistency-check.c
@@ -86,8 +86,9 @@ int consistency_test(int clock_type, unsigned long seconds)
 			for (i = 0; i < CALLS_PER_LOOP; i++) {
 				if (i == inconsistent)
 					ksft_print_msg("--------------------\n");
-				ksft_print_msg("%lu:%lu\n", list[i].tv_sec,
-							list[i].tv_nsec);
+				ksft_print_msg("%lld:%ld\n",
+					       (long long)list[i].tv_sec,
+					       (long)list[i].tv_nsec);
 				if (i == inconsistent + 1)
 					ksft_print_msg("--------------------\n");
 			}
diff --git a/tools/testing/selftests/timers/leap-a-day.c b/tools/testing/selftests/timers/leap-a-day.c
index b93cb5714b37b..e932e13071ed2 100644
--- a/tools/testing/selftests/timers/leap-a-day.c
+++ b/tools/testing/selftests/timers/leap-a-day.c
@@ -139,20 +139,21 @@ void sigalarm(int signo)
 	ret = adjtimex(&tx);
 
 	if (tx.time.tv_sec < next_leap) {
-		printf("Error: Early timer expiration! (Should be %ld)\n", next_leap);
+		printf("Error: Early timer expiration! (Should be %lld)\n",
+		       (long long)next_leap);
 		error_found = 1;
-		printf("adjtimex: %10ld sec + %6ld us (%i)\t%s\n",
-					tx.time.tv_sec,
-					tx.time.tv_usec,
+		printf("adjtimex: %10lld sec + %6lld us (%i)\t%s\n",
+					(long long)tx.time.tv_sec,
+					(long long)tx.time.tv_usec,
 					tx.tai,
 					time_state_str(ret));
 	}
 	if (ret != TIME_WAIT) {
 		printf("Error: Timer seeing incorrect NTP state? (Should be TIME_WAIT)\n");
 		error_found = 1;
-		printf("adjtimex: %10ld sec + %6ld us (%i)\t%s\n",
-					tx.time.tv_sec,
-					tx.time.tv_usec,
+		printf("adjtimex: %10lld sec + %6lld us (%i)\t%s\n",
+					(long long)tx.time.tv_sec,
+					(long long)tx.time.tv_usec,
 					tx.tai,
 					time_state_str(ret));
 	}
@@ -291,7 +292,8 @@ int main(int argc, char **argv)
 		printf("Scheduling leap second for %s", ctime(&next_leap));
 
 		/* Set up timer */
-		printf("Setting timer for %ld -  %s", next_leap, ctime(&next_leap));
+		printf("Setting timer for %lld -  %s", (long long)next_leap,
+		       ctime(&next_leap));
 		memset(&se, 0, sizeof(se));
 		se.sigev_notify = SIGEV_SIGNAL;
 		se.sigev_signo = signum;
@@ -339,17 +341,17 @@ int main(int argc, char **argv)
 
 			if (tai_time) {
 				clock_gettime(CLOCK_TAI, &tai);
-				printf("%ld sec, %9ld ns\t%s\n",
-						tai.tv_sec,
-						tai.tv_nsec,
+				printf("%lld sec, %9ld ns\t%s\n",
+						(long long)tai.tv_sec,
+						(long)tai.tv_nsec,
 						time_state_str(ret));
 			} else {
 				ctime_r(&tx.time.tv_sec, buf);
 				buf[strlen(buf)-1] = 0; /*remove trailing\n */
 
-				printf("%s + %6ld us (%i)\t%s\n",
+				printf("%s + %6lld us (%i)\t%s\n",
 						buf,
-						tx.time.tv_usec,
+						(long long)tx.time.tv_usec,
 						tx.tai,
 						time_state_str(ret));
 			}
diff --git a/tools/testing/selftests/timers/rtcpie.c b/tools/testing/selftests/timers/rtcpie.c
index 4ba42d198b7ec..5d88c78e3bdbc 100644
--- a/tools/testing/selftests/timers/rtcpie.c
+++ b/tools/testing/selftests/timers/rtcpie.c
@@ -111,8 +111,8 @@ int main(int argc, char **argv)
 			timersub(&end, &start, &diff);
 			if (diff.tv_sec > 0 ||
 			    diff.tv_usec > ((1000000L / tmp) * 1.10)) {
-				fprintf(stderr, "\nPIE delta error: %ld.%06ld should be close to 0.%06ld\n",
-				       diff.tv_sec, diff.tv_usec,
+				fprintf(stderr, "\nPIE delta error: %lld.%06lld should be close to 0.%06lu\n",
+				       (long long)diff.tv_sec, (long long)diff.tv_usec,
 				       (1000000L / tmp));
 				fflush(stdout);
 				exit(-1);
diff --git a/tools/testing/selftests/timers/threadtest.c b/tools/testing/selftests/timers/threadtest.c
index 60b8b21bf7824..fbf5d4cd80792 100644
--- a/tools/testing/selftests/timers/threadtest.c
+++ b/tools/testing/selftests/timers/threadtest.c
@@ -63,7 +63,8 @@ void checklist(const struct timespec *list, int size)
 			for (j = 0; j < size; j++) {
 				if (j == i)
 					printf("---------------\n");
-				printf("%lu:%lu\n", list[j].tv_sec, list[j].tv_nsec);
+				printf("%lld:%ld\n", (long long)list[j].tv_sec,
+				       (long)list[j].tv_nsec);
 				if (j == i+1)
 					printf("---------------\n");
 			}
@@ -162,7 +163,8 @@ int main(int argc, char **argv)
 	start = time(0);
 	strftime(buf, 255, "%a, %d %b %Y %T %z", localtime(&start));
 	printf("%s\n", buf);
-	printf("Testing consistency with %i threads for %ld seconds: ", thread_count, runtime);
+	printf("Testing consistency with %i threads for %lld seconds: ",
+	       thread_count, (long long)runtime);
 	fflush(stdout);
 
 	/* spawn */
diff --git a/tools/testing/selftests/timers/valid-adjtimex.c b/tools/testing/selftests/timers/valid-adjtimex.c
index f641d5fb09023..c666a327d0580 100644
--- a/tools/testing/selftests/timers/valid-adjtimex.c
+++ b/tools/testing/selftests/timers/valid-adjtimex.c
@@ -136,8 +136,8 @@ int validate_freq(void)
 		tx.modes = 0;
 		ret = adjtimex(&tx);
 		if (tx.freq != valid_freq[i]) {
-			printf("Warning: freq value %ld not what we set it (%ld)!\n",
-					tx.freq, valid_freq[i]);
+			printf("Warning: freq value %lld not what we set it (%ld)!\n",
+					(long long)tx.freq, valid_freq[i]);
 		}
 	}
 	for (i = 0; i < NUM_FREQ_OUTOFRANGE; i++) {
@@ -156,8 +156,8 @@ int validate_freq(void)
 		ret = adjtimex(&tx);
 		if (tx.freq == outofrange_freq[i]) {
 			printf("[FAIL]\n");
-			printf("ERROR: out of range value %ld actually set!\n",
-					tx.freq);
+			printf("ERROR: out of range value %lld actually set!\n",
+					(long long)tx.freq);
 			pass = -1;
 			goto out;
 		}
@@ -218,7 +218,8 @@ int set_offset(long long offset, int use_nano)
 
 	ret = clock_adjtime(CLOCK_REALTIME, &tmx);
 	if (ret < 0) {
-		printf("(sec: %ld  usec: %ld) ", tmx.time.tv_sec, tmx.time.tv_usec);
+		printf("(sec: %lld  usec: %lld) ", (long long)tmx.time.tv_sec,
+		       (long long)tmx.time.tv_usec);
 		printf("[FAIL]\n");
 		return -1;
 	}
@@ -238,7 +239,8 @@ int set_bad_offset(long sec, long usec, int use_nano)
 	tmx.time.tv_usec = usec;
 	ret = clock_adjtime(CLOCK_REALTIME, &tmx);
 	if (ret >= 0) {
-		printf("Invalid (sec: %ld  usec: %ld) did not fail! ", tmx.time.tv_sec, tmx.time.tv_usec);
+		printf("Invalid (sec: %lld  usec: %lld) did not fail! ",
+		       (long long)tmx.time.tv_sec, (long long)tmx.time.tv_usec);
 		printf("[FAIL]\n");
 		return -1;
 	}
-- 
2.53.0

