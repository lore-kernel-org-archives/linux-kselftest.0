From: nick.desaulniers@gmail.com (Nick Desaulniers)
Date: Thu, 28 Dec 2017 22:08:29 -0500
Subject: [Linux-kselftest-mirror] [PATCH] posix-timers: prevent UB from
	shifting negative signed value
In-Reply-To: <1514516474-15811-1-git-send-email-nick.desaulniers@gmail.com>
References: <alpine.DEB.2.20.1712281645540.1899@nanos>
 <1514516474-15811-1-git-send-email-nick.desaulniers@gmail.com>
Message-ID:
 <CAH7mPvji6LUxJ-L7WqUAiVMCdr9m_Tc_jRrZ5=p0XoVt5nL3aw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171229030829.ms2Tl50sQdtB8KRnla-K9QlTS-GbIZ3CI9P5-CuWN3I@z>

sorry, fd_to_clockid() should probably return a clockid_t, let me fix that.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
