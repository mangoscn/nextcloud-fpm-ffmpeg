FROM nextcloud:fpm

# 安装 ffmpeg 包
RUN apt-get update && apt-get install -y --no-install-recommends \
    cron \
    ffmpeg \
    # svg support
    libmagickcore-6.q16-3-extra

# 设置 crontab 任务
RUN echo '*/10 * * * * www-data php /var/www/html/occ preview:pre-generate' >> /etc/crontab

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]