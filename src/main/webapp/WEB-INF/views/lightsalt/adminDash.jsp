<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin Dashboard</title>

    <!-- #### common ####-->
    <!-- favicon -->
    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <!-- icon -->
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>
    <script src="https://code.iconify.design/2/2.1.0/iconify.min.js"></script>
    <!-- font -->
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <!-- bootstrap v5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <!-- jquery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

     <!-- #### style ####-->
    <!-- css -->
    <link href="/resources/css/lightsalt/adminDash.css" rel="stylesheet">
    <!-- java script -->
    <script src="js/lightsalt/admin_chk.js"></script>
    
  <!-- Nucleo Icons -->
  <link href="/resources/css/lightsalt/nucleo-icons.css" rel="stylesheet" />
  <link href="/resources/css/lightsalt/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <!-- Material Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
  <!-- CSS Files -->
  <link id="pagestyle" href="/resources/css/lightsalt/material-dashboard.css?v=3.0.4" rel="stylesheet" />

</head>

<body>
    <div class="wrap">
        <!-- header s -->
        <%@ include file= "/WEB-INF/views/include/adminHeader.jsp" %>
        <!-- header e -->

        <div id="content-body">
        <!-- side s -->
        <%@ include file= "/WEB-INF/views/include/adminAside.jsp" %>
        <!-- side e -->
  
        <!-- 컨텐츠 (게시글) -->
        <div class="content-container">
           
            <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg">
                
                <!-- End Navbar -->
                <div class="container-fluid py-4">
                  <div class="row">
                    <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                      <div class="card">
                        <div class="card-header p-3 pt-2 marginx">
                          <div class="icon icon-lg icon-shape bg-gradient-dark shadow-dark text-center border-radius-xl mt-n4 position-absolute">
                            <i class="material-icons opacity-10">weekend</i>
                          </div>
                          <div class="text-end pt-1">
                            <p class="text-sm mb-0 text-capitalize">Today's Money</p>
                            <h4 class="mb-0">$53k</h4>
                          </div>
                        </div>
                        <hr class="dark horizontal my-0">
                        <div class="card-footer p-3 marginx">
                          <p class="mb-0"><span class="text-success text-sm font-weight-bolder">+55% </span>than last week</p>
                        </div>
                      </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                      <div class="card">
                        <div class="card-header p-3 pt-2 marginx">
                          <div class="icon icon-lg icon-shape bg-gradient-primary shadow-primary text-center border-radius-xl mt-n4 position-absolute">
                            <i class="material-icons opacity-10">person</i>
                          </div>
                          <div class="text-end pt-1">
                            <p class="text-sm mb-0 text-capitalize">Today's Users</p>
                            <h4 class="mb-0">2,300</h4>
                          </div>
                        </div>
                        <hr class="dark horizontal my-0">
                        <div class="card-footer p-3 marginx">
                          <p class="mb-0"><span class="text-success text-sm font-weight-bolder">+3% </span>than last month</p>
                        </div>
                      </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                      <div class="card">
                        <div class="card-header p-3 pt-2 marginx">
                          <div class="icon icon-lg icon-shape bg-gradient-success shadow-success text-center border-radius-xl mt-n4 position-absolute">
                            <i class="material-icons opacity-10">person</i>
                          </div>
                          <div class="text-end pt-1">
                            <p class="text-sm mb-0 text-capitalize">New Clients</p>
                            <h4 class="mb-0">3,462</h4>
                          </div>
                        </div>
                        <hr class="dark horizontal my-0">
                        <div class="card-footer p-3 marginx">
                          <p class="mb-0"><span class="text-danger text-sm font-weight-bolder">-2%</span> than yesterday</p>
                        </div>
                      </div>
                    </div>
                    <div class="col-xl-3 col-sm-6">
                      <div class="card">
                        <div class="card-header p-3 pt-2 marginx">
                          <div class="icon icon-lg icon-shape bg-gradient-info shadow-info text-center border-radius-xl mt-n4 position-absolute">
                            <i class="material-icons opacity-10">weekend</i>
                          </div>
                          <div class="text-end pt-1">
                            <p class="text-sm mb-0 text-capitalize">Sales</p>
                            <h4 class="mb-0">$103,430</h4>
                          </div>
                        </div>
                        <hr class="dark horizontal my-0">
                        <div class="card-footer p-3 marginx">
                          <p class="mb-0 "><span class="text-success text-sm font-weight-bolder">+5% </span>than yesterday</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row mt-4">
                    <div class="col-lg-4 col-md-6 mt-4 mb-4">
                      <div class="card z-index-2 ">
                        <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 bg-transparent">
                          <div class="bg-gradient-primary shadow-primary border-radius-lg py-3 pe-1">
                            <div class="chart">
                              <canvas id="chart-bars" class="chart-canvas" height="170"></canvas>
                            </div>
                          </div>
                        </div>
                        <div class="card-body">
                          <h6 class="mb-0 ">Website Views</h6>
                          <p class="text-sm ">Last Campaign Performance</p>
                          <hr class="dark horizontal">
                          <div class="d-flex ">
                            <i class="material-icons text-sm my-auto me-1">schedule</i>
                            <p class="mb-0 text-sm"> campaign sent 2 days ago </p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mt-4 mb-4">
                      <div class="card z-index-2  ">
                        <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 bg-transparent">
                          <div class="bg-gradient-success shadow-success border-radius-lg py-3 pe-1">
                            <div class="chart">
                              <canvas id="chart-line" class="chart-canvas" height="170"></canvas>
                            </div>
                          </div>
                        </div>
                        <div class="card-body">
                          <h6 class="mb-0 "> Daily Sales </h6>
                          <p class="text-sm "> (<span class="font-weight-bolder">+15%</span>) increase in today sales. </p>
                          <hr class="dark horizontal">
                          <div class="d-flex ">
                            <i class="material-icons text-sm my-auto me-1">schedule</i>
                            <p class="mb-0 text-sm"> updated 4 min ago </p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-4 mt-4 mb-3">
                      <div class="card z-index-2 ">
                        <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 bg-transparent">
                          <div class="bg-gradient-dark shadow-dark border-radius-lg py-3 pe-1">
                            <div class="chart">
                              <canvas id="chart-line-tasks" class="chart-canvas" height="170"></canvas>
                            </div>
                          </div>
                        </div>
                        <div class="card-body">
                          <h6 class="mb-0 ">Completed Tasks</h6>
                          <p class="text-sm ">Last Campaign Performance</p>
                          <hr class="dark horizontal">
                          <div class="d-flex ">
                            <i class="material-icons text-sm my-auto me-1">schedule</i>
                            <p class="mb-0 text-sm">just updated</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </main>
              <div class="fixed-plugin">
                <a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
                  <i class="material-icons py-2">settings</i>
                </a>
                <div class="card shadow-lg">
                  <div class="card-header pb-0 pt-3">
                    <div class="float-start">
                      <h5 class="mt-3 mb-0">Material UI Configurator</h5>
                      <p>See our dashboard options.</p>
                    </div>
                    <div class="float-end mt-4">
                      <button class="btn btn-link text-dark p-0 fixed-plugin-close-button">
                        <i class="material-icons">clear</i>
                      </button>
                    </div>
                    <!-- End Toggle Button -->
                  </div>
                  <hr class="horizontal dark my-1">
                  <div class="card-body pt-sm-3 pt-0">
                    <!-- Sidebar Backgrounds -->
                    <div>
                      <h6 class="mb-0">Sidebar Colors</h6>
                    </div>
                    <a href="javascript:void(0)" class="switch-trigger background-color">
                      <div class="badge-colors my-2 text-start">
                        <span class="badge filter bg-gradient-primary active" data-color="primary" onclick="sidebarColor(this)"></span>
                        <span class="badge filter bg-gradient-dark" data-color="dark" onclick="sidebarColor(this)"></span>
                        <span class="badge filter bg-gradient-info" data-color="info" onclick="sidebarColor(this)"></span>
                        <span class="badge filter bg-gradient-success" data-color="success" onclick="sidebarColor(this)"></span>
                        <span class="badge filter bg-gradient-warning" data-color="warning" onclick="sidebarColor(this)"></span>
                        <span class="badge filter bg-gradient-danger" data-color="danger" onclick="sidebarColor(this)"></span>
                      </div>
                    </a>
                    <!-- Sidenav Type -->
                    <div class="mt-3">
                      <h6 class="mb-0">Sidenav Type</h6>
                      <p class="text-sm">Choose between 2 different sidenav types.</p>
                    </div>
                    <div class="d-flex">
                      <button class="btn bg-gradient-dark px-3 mb-2 active" data-class="bg-gradient-dark" onclick="sidebarType(this)">Dark</button>
                      <button class="btn bg-gradient-dark px-3 mb-2 ms-2" data-class="bg-transparent" onclick="sidebarType(this)">Transparent</button>
                      <button class="btn bg-gradient-dark px-3 mb-2 ms-2" data-class="bg-white" onclick="sidebarType(this)">White</button>
                    </div>
                    <p class="text-sm d-xl-none d-block mt-2">You can change the sidenav type just on desktop view.</p>
                    <!-- Navbar Fixed -->
                    <div class="mt-3 d-flex">
                      <h6 class="mb-0">Navbar Fixed</h6>
                      <div class="form-check form-switch ps-0 ms-auto my-auto">
                        <input class="form-check-input mt-1 ms-auto" type="checkbox" id="navbarFixed" onclick="navbarFixed(this)">
                      </div>
                    </div>
                    <hr class="horizontal dark my-3">
                    <div class="mt-2 d-flex">
                      <h6 class="mb-0">Light / Dark</h6>
                      <div class="form-check form-switch ps-0 ms-auto my-auto">
                        <input class="form-check-input mt-1 ms-auto" type="checkbox" id="dark-version" onclick="darkMode(this)">
                      </div>
                    </div>
                    <hr class="horizontal dark my-sm-4">
                    <a class="btn bg-gradient-info w-100" href="https://www.creative-tim.com/product/material-dashboard-pro">Free Download</a>
                    <a class="btn btn-outline-dark w-100" href="https://www.creative-tim.com/learning-lab/bootstrap/overview/material-dashboard">View documentation</a>
                    <div class="w-100 text-center">
                      <a class="github-button" href="https://github.com/creativetimofficial/material-dashboard" data-icon="octicon-star" data-size="large" data-show-count="true" aria-label="Star creativetimofficial/material-dashboard on GitHub">Star</a>
                      <h6 class="mt-3">Thank you for sharing!</h6>
                      <a href="https://twitter.com/intent/tweet?text=Check%20Material%20UI%20Dashboard%20made%20by%20%40CreativeTim%20%23webdesign%20%23dashboard%20%23bootstrap5&amp;url=https%3A%2F%2Fwww.creative-tim.com%2Fproduct%2Fsoft-ui-dashboard" class="btn btn-dark mb-0 me-2" target="_blank">
                        <i class="fab fa-twitter me-1" aria-hidden="true"></i> Tweet
                      </a>
                      <a href="https://www.facebook.com/sharer/sharer.php?u=https://www.creative-tim.com/product/material-dashboard" class="btn btn-dark mb-0 me-2" target="_blank">
                        <i class="fab fa-facebook-square me-1" aria-hidden="true"></i> Share
                      </a>
                    </div>
                  </div>
                </div>
              </div>
              </div>
              <!--   Core JS Files   -->
              <script src="/resources/js/lightsalt/core/popper.min.js"></script>
              <script src="/resources/js/lightsalt/core/bootstrap.min.js"></script>
              <script src="/resources/js/lightsalt/plugins/perfect-scrollbar.min.js"></script>
              <script src="/resources/js/lightsalt/plugins/smooth-scrollbar.min.js"></script>
              <script src="/resources/js/lightsalt/plugins/chartjs.min.js"></script>
              <script>
                var ctx = document.getElementById("chart-bars").getContext("2d");
            
                new Chart(ctx, {
                  type: "bar",
                  data: {
                    labels: ["M", "T", "W", "T", "F", "S", "S"],
                    datasets: [{
                      label: "Sales",
                      tension: 0.4,
                      borderWidth: 0,
                      borderRadius: 4,
                      borderSkipped: false,
                      backgroundColor: "rgba(255, 255, 255, .8)",
                      data: [50, 20, 10, 22, 50, 10, 40],
                      maxBarThickness: 6
                    }, ],
                  },
                  options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                      legend: {
                        display: false,
                      }
                    },
                    interaction: {
                      intersect: false,
                      mode: 'index',
                    },
                    scales: {
                      y: {
                        grid: {
                          drawBorder: false,
                          display: true,
                          drawOnChartArea: true,
                          drawTicks: false,
                          borderDash: [5, 5],
                          color: 'rgba(255, 255, 255, .2)'
                        },
                        ticks: {
                          suggestedMin: 0,
                          suggestedMax: 500,
                          beginAtZero: true,
                          padding: 10,
                          font: {
                            size: 14,
                            weight: 300,
                            family: "SCoreDream",
                            style: 'normal',
                            lineHeight: 2
                          },
                          color: "#fff"
                        },
                      },
                      x: {
                        grid: {
                          drawBorder: false,
                          display: true,
                          drawOnChartArea: true,
                          drawTicks: false,
                          borderDash: [5, 5],
                          color: 'rgba(255, 255, 255, .2)'
                        },
                        ticks: {
                          display: true,
                          color: '#f8f9fa',
                          padding: 10,
                          font: {
                            size: 14,
                            weight: 300,
                            family: "SCoreDream",
                            style: 'normal',
                            lineHeight: 2
                          },
                        }
                      },
                    },
                  },
                });
            
            
                var ctx2 = document.getElementById("chart-line").getContext("2d");
            
                new Chart(ctx2, {
                  type: "line",
                  data: {
                    labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                    datasets: [{
                      label: "Mobile apps",
                      tension: 0,
                      borderWidth: 0,
                      pointRadius: 5,
                      pointBackgroundColor: "rgba(255, 255, 255, .8)",
                      pointBorderColor: "transparent",
                      borderColor: "rgba(255, 255, 255, .8)",
                      borderColor: "rgba(255, 255, 255, .8)",
                      borderWidth: 4,
                      backgroundColor: "transparent",
                      fill: true,
                      data: [50, 40, 300, 320, 500, 350, 200, 230, 500],
                      maxBarThickness: 6
            
                    }],
                  },
                  options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                      legend: {
                        display: false,
                      }
                    },
                    interaction: {
                      intersect: false,
                      mode: 'index',
                    },
                    scales: {
                      y: {
                        grid: {
                          drawBorder: false,
                          display: true,
                          drawOnChartArea: true,
                          drawTicks: false,
                          borderDash: [5, 5],
                          color: 'rgba(255, 255, 255, .2)'
                        },
                        ticks: {
                          display: true,
                          color: '#f8f9fa',
                          padding: 10,
                          font: {
                            size: 14,
                            weight: 300,
                            family: "SCoreDream",
                            style: 'normal',
                            lineHeight: 2
                          },
                        }
                      },
                      x: {
                        grid: {
                          drawBorder: false,
                          display: false,
                          drawOnChartArea: false,
                          drawTicks: false,
                          borderDash: [5, 5]
                        },
                        ticks: {
                          display: true,
                          color: '#f8f9fa',
                          padding: 10,
                          font: {
                            size: 14,
                            weight: 300,
                            family: "SCoreDream",
                            style: 'normal',
                            lineHeight: 2
                          },
                        }
                      },
                    },
                  },
                });
            
                var ctx3 = document.getElementById("chart-line-tasks").getContext("2d");
            
                new Chart(ctx3, {
                  type: "line",
                  data: {
                    labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                    datasets: [{
                      label: "Mobile apps",
                      tension: 0,
                      borderWidth: 0,
                      pointRadius: 5,
                      pointBackgroundColor: "rgba(255, 255, 255, .8)",
                      pointBorderColor: "transparent",
                      borderColor: "rgba(255, 255, 255, .8)",
                      borderWidth: 4,
                      backgroundColor: "transparent",
                      fill: true,
                      data: [50, 40, 300, 220, 500, 250, 400, 230, 500],
                      maxBarThickness: 6
            
                    }],
                  },
                  options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                      legend: {
                        display: false,
                      }
                    },
                    interaction: {
                      intersect: false,
                      mode: 'index',
                    },
                    scales: {
                      y: {
                        grid: {
                          drawBorder: false,
                          display: true,
                          drawOnChartArea: true,
                          drawTicks: false,
                          borderDash: [5, 5],
                          color: 'rgba(255, 255, 255, .2)'
                        },
                        ticks: {
                          display: true,
                          padding: 10,
                          color: '#f8f9fa',
                          font: {
                            size: 14,
                            weight: 300,
                            family: "SCoreDream",
                            style: 'normal',
                            lineHeight: 2
                          },
                        }
                      },
                      x: {
                        grid: {
                          drawBorder: false,
                          display: false,
                          drawOnChartArea: false,
                          drawTicks: false,
                          borderDash: [5, 5]
                        },
                        ticks: {
                          display: true,
                          color: '#f8f9fa',
                          padding: 10,
                          font: {
                            size: 14,
                            weight: 300,
                            family: "SCoreDream",
                            style: 'normal',
                            lineHeight: 2
                          },
                        }
                      },
                    },
                  },
                });
              </script>
              <script>
                var win = navigator.platform.indexOf('Win') > -1;
                if (win && document.querySelector('#sidenav-scrollbar')) {
                  var options = {
                    damping: '0.5'
                  }
                  Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
                }
              </script>
              <!-- Github buttons -->
              <script async defer src="https://buttons.github.io/buttons.js"></script>
              <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
              <script src="../assets/js/material-dashboard.min.js?v=3.0.4"></script>
            
        </div>
        </div>
    </div>

</body>

</html>